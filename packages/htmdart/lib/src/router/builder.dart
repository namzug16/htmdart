import "dart:async";
import "dart:io";

import "package:htmdart/src/router/group.dart";
import "package:htmdart/src/router/path_registry.dart";
import "package:htmdart/src/router/radix_tree.dart";
import "package:htmdart/src/router/route_node.dart";
import "package:htmdart/src/router/utils.dart";
import "package:http_parser/http_parser.dart" as http_parser;
import "package:mime/mime.dart";
import "package:shelf/shelf.dart";

abstract class Builder {
  Builder(this._parent, this.rTree);

  final Builder? _parent;
  final RadixTree<RouteNode> rTree;

  Middleware? get middleware {
    if (_parent?.middleware != null) {
      if (_middleware != null) {
        return _parent?.middleware?.addMiddleware(_middleware!);
      } else {
        return _parent?.middleware;
      }
    }

    return _middleware;
  }

  Middleware? _middleware;

  Group group(String? prefix, [Middleware? middleware]) {
    return Group(this, rTree, prefix, middleware);
  }

  void use(Middleware m) {
    if (_middleware == null) {
      _middleware = m;
    } else {
      _middleware = _middleware!.addMiddleware(m);
    }
  }

  void add(String verb, String route, Function handler) {
    // Should I add it back?
    // if (!isHttpMethod(verb)) {
    //   throw ArgumentError.value(verb, 'verb', 'expected a valid HTTP method');
    // }
    final v = verb.toUpperCase();

    PathRegistry().registerPath(route, v, handler);

    if (v == "GET") {
      // Handling in a 'GET' request without handling a 'HEAD' request is always
      // wrong, thus, we add a default implementation that discards the body.
      rTree.insert("HEAD$route", RouteNode(handler, this));
    }
    rTree.insert("$verb$route", RouteNode(handler, this));
  }

  void redirect(String route, String redirect) => add("GET", route, (req) => Response.movedPermanently(redirect));

  void get(String route, Function handler) => add("GET", route, handler);

  void head(String route, Function handler) => add("HEAD", route, handler);

  void post(String route, Function handler) => add("POST", route, handler);

  void put(String route, Function handler) => add("PUT", route, handler);

  void delete(String route, Function handler) => add("DELETE", route, handler);

  void connect(String route, Function handler) => add("CONNECT", route, handler);

  void options(String route, Function handler) => add("OPTIONS", route, handler);

  void trace(String route, Function handler) => add("TRACE", route, handler);

  void patch(String route, Function handler) => add("PATCH", route, handler);

  void static(String prefix, String root) {
    checkPath(prefix);

    final rootDir = Directory(root);

    if (!rootDir.existsSync()) {
      throw ArgumentError('A directory corresponding to fileSystemPath "$root" could not be found');
    }

    final r = rootDir.resolveSymbolicLinksSync();

    final entities = rootDir.listSync(recursive: true);

    for (final e in entities) {
      final eType = FileSystemEntity.typeSync(e.path);
      if (eType == FileSystemEntityType.file) {
        final fp = e.resolveSymbolicLinksSync();
        String p = fp;
        if (prefix == "/") {
          p = fp.replaceFirst(r, "");
        } else {
          p = fp.replaceFirst("$r/", prefix);
        }
        file(p, fp);
      }
    }
  }

  void file(String path, String filePath) {
    checkPath(path);
    final eType = FileSystemEntity.typeSync(filePath);
    if (eType == FileSystemEntityType.file) {
      final file = File(filePath);
      get(
        path,
        (Request req) => _handleFile(req, file, () async {
          final mimeResolver = MimeTypeResolver();
          return mimeResolver.lookup(file.path);
        }),
      );
    } else {
      throw ArgumentError.value(filePath, "file", 'The provided file path "$filePath" does not refer to an existing file. Please verify that the file exists and the path is correct.');
    }
  }
}

Future<Response> _handleFile(Request request, File file, FutureOr<String?> Function() getContentType) async {
  final stat = file.statSync();
  final ifModifiedSince = request.ifModifiedSince;

  if (ifModifiedSince != null) {
    final fileChangeAtSecResolution = _toSecondResolution(stat.modified);
    if (!fileChangeAtSecResolution.isAfter(ifModifiedSince)) {
      return Response.notModified();
    }
  }

  final contentType = await getContentType();
  final headers = {
    HttpHeaders.lastModifiedHeader: http_parser.formatHttpDate(stat.modified),
    HttpHeaders.acceptRangesHeader: "bytes",
    if (contentType != null) HttpHeaders.contentTypeHeader: contentType,
  };

  return _fileRangeResponse(request, file, headers) ??
      Response.ok(
        request.method == "HEAD" ? null : file.openRead(),
        headers: headers..[HttpHeaders.contentLengthHeader] = "${stat.size}",
      );
}

DateTime _toSecondResolution(DateTime dt) {
  if (dt.millisecond == 0) return dt;
  return dt.subtract(Duration(milliseconds: dt.millisecond));
}

final _bytesMatcher = RegExp(r"^bytes=(\d*)-(\d*)$");

Response? _fileRangeResponse(Request request, File file, Map<String, Object> headers) {
  final range = request.headers[HttpHeaders.rangeHeader];
  if (range == null) return null;
  final matches = _bytesMatcher.firstMatch(range);
  // Ignore ranges other than bytes
  if (matches == null) return null;

  final actualLength = file.lengthSync();
  final startMatch = matches[1]!;
  final endMatch = matches[2]!;
  if (startMatch.isEmpty && endMatch.isEmpty) return null;

  int start; // First byte position - inclusive.
  int end; // Last byte position - inclusive.
  if (startMatch.isEmpty) {
    start = actualLength - int.parse(endMatch);
    if (start < 0) start = 0;
    end = actualLength - 1;
  } else {
    start = int.parse(startMatch);
    end = endMatch.isEmpty ? actualLength - 1 : int.parse(endMatch);
  }

  // If the range is syntactically invalid the Range header
  // MUST be ignored (RFC 2616 section 14.35.1).
  if (start > end) return null;

  if (end >= actualLength) {
    end = actualLength - 1;
  }
  if (start >= actualLength) {
    return Response(
      HttpStatus.requestedRangeNotSatisfiable,
      headers: headers,
    );
  }
  return Response(
    HttpStatus.partialContent,
    body: request.method == "HEAD" ? null : file.openRead(start, end + 1),
    headers: headers
      ..[HttpHeaders.contentLengthHeader] = (end - start + 1).toString()
      ..[HttpHeaders.contentRangeHeader] = "bytes $start-$end/$actualLength",
  );
}
