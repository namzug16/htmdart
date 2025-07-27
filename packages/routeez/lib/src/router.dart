import "dart:convert";

import "package:routeez/src/builder.dart";
import "package:routeez/src/radix_tree.dart";
import "package:routeez/src/route_node.dart";
import "package:routeez/src/utils.dart";
import "package:shelf/shelf.dart";

class Router extends Builder {
  Router() : super(null, RadixTree<RouteNode>());

  Handler? _notFoundHandler;

  Future<Response> call(Request request) async {
    final path = normalizePath(request.url.path);

    var rr = rTree.get("${request.method.toUpperCase()}$path");

    //NOTE: this allows you to add an any and multiple other verbs for the same path. Should it be allowed?
    rr ??= rTree.get("ANY$path");

    if (rr == null) {
      return (_notFoundHandler ?? _defaultNotFound)(request);
    }

    // TODO(me): find a way to centrally manage errors
    final response = await rr.value.invoke(request, rr.params);

    return response;
  }

  Response _defaultNotFound(Request request) => _RouteNotFoundResponse();
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
