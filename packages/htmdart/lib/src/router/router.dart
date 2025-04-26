import "dart:async";
import "dart:convert";
import "dart:io";

import "package:htmdart/src/middlewares/pretty_log_middleware.dart";
import "package:htmdart/src/router/path_registry.dart";
import "package:htmdart/src/router/route_node.dart";
import "package:htmdart/src/router/utils.dart";
import "package:http_parser/http_parser.dart";
import "package:mime/mime.dart";
import "package:shelf/shelf.dart";

abstract class _Router {
  _Router(this._rn, this._middleware);

  final RouteNode _rn;

  Middleware? _middleware;

  GroupRouter group(String group) => GroupRouter(_rn, _middleware, group);

  void use(Middleware middleware) {
    if (_middleware == null) {
      _middleware = middleware;
    } else {
      _middleware = _middleware!.addMiddleware(middleware);
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
      _rn.insertPath("HEAD", route, handler, _removeBodyMiddleware.addMiddleware(_middleware ?? (Handler h) => h));
    }
    _rn.insertPath(v, route, handler, _middleware);
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

class Router extends _Router {
  Router()
      : _loggerMiddleware = prettyLogMiddleware(),
        super(RouteNode(segment: ""), null);

  Middleware _loggerMiddleware;

  //
  // ignore: use_setters_to_change_properties
  void loggerMiddleware(Middleware middleware) {
    _loggerMiddleware = middleware;
  }

  Handler? _notFoundHandler;

  //
  // ignore: use_setters_to_change_properties
  void notFoundHandler(Handler handler) {
    _notFoundHandler = handler;
  }

  Future<Response> call(Request request) async => await _loggerMiddleware((request) async {
        final match = _rn.matchPath(request.method.toUpperCase(), request.url.path);

        if (match == null) {
          return (_notFoundHandler ?? _defaultNotFound)(request);
        }

        // TODO(me): find a way to centrally manage errors
        final response = await match.$1.invoke(request, match.$2);

        return response;
      })(request);

  Response _defaultNotFound(Request request) => _RouteNotFoundResponse();
}

class GroupRouter extends _Router {
  GroupRouter(super.rn, super.middleware, this.path) : super() {
    checkPath(path);
  }

  final String path;

  @override
  void add(String verb, String route, Function handler) {
    //
    // ignore: prefer_double_quotes
    super.add(verb, '$path$route', handler);
  }
}

class _RouteNotFoundResponse extends Response {
  _RouteNotFoundResponse() : super.notFound(_message);

  static const _message = "Route not found";
  static final _messageBytes = utf8.encode(_message);

  @override
  Stream<List<int>> read() => Stream<List<int>>.value(_messageBytes);

  @override
  Response change({
    Map<String, /* String | List<String> */ Object?>? headers,
    Map<String, Object?>? context,
    Object? body,
  }) {
    return super.change(
      headers: headers,
      context: context,
      body: body ?? _message,
    );
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
    HttpHeaders.lastModifiedHeader: formatHttpDate(stat.modified),
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

final _removeBodyMiddleware = createMiddleware(
  responseHandler: (r) {
    if (r.headers.containsKey("content-length")) {
      r = r.change(headers: {"content-length": "0"});
    }
    return r.change(body: <int>[]);
  },
);
