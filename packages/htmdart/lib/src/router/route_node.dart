import "package:htmdart/src/router/builder.dart";
import "package:shelf/shelf.dart";

class RouteNode {
  RouteNode(this.handler, this.builder);
  Function? handler;
  //NOTE: we store a reference to the builder in order to extract the
  // most updated middleware
  Builder builder;

  Future<Response> invoke(Request request, Map<String, String> params) async {
    // TODO(me): should I expose them?
    final r = request.change(context: {"htmdart/params": params});

    Future<Response> h(Request request) async {
      if (handler is Handler || params.isEmpty) {
        //
        // ignore: avoid_dynamic_calls
        return await handler!(request) as Response;
      }
      return await Function.apply(handler!, [
        request,
        ...params.values,
      ]) as Response;
    }

    if (builder.middleware != null) {
      if (request.method.toUpperCase() == "HEAD") {
        //FIX: _removeBodyMiddleware is being added every time
        final middleware = _removeBodyMiddleware.addMiddleware(builder.middleware ?? (Handler h) => h);
        return middleware(h)(r);
      } else {
        return builder.middleware!(h)(r);
      }
    }

    return h(r);
  }
}

final _removeBodyMiddleware = createMiddleware(
  responseHandler: (r) {
    if (r.headers.containsKey("content-length")) {
      r = r.change(headers: {"content-length": "0"});
    }
    return r.change(body: <int>[]);
  },
);
