import "package:htmdart/src/router/builder.dart";
import "package:htmdart/src/router/radix_tree.dart";
import "package:htmdart/src/router/route_node.dart";
import "package:htmdart/src/router/utils.dart";
import "package:shelf/shelf.dart";

class Router extends Builder {
  Router() : super(null, RadixTree<RouteNode>());

  Handler? _notFoundHandler;

  Future<Response> call(Request request) async {
    final path = normalizePath(request.url.path);

    final rr = rTree.get("${request.method.toUpperCase()}$path");

    if (rr == null) {
      return (_notFoundHandler ?? _defaultNotFound)(request);
    }

    // TODO(me): find a way to centrally manage errors
    final response = await rr.value.invoke(request, rr.params);

    return response;
  }

  //
  // ignore: use_setters_to_change_properties
  void notFoundHandler(Handler handler) => _notFoundHandler = handler;
}

Response _defaultNotFound(Request request) => Response.notFound("Route not found");
