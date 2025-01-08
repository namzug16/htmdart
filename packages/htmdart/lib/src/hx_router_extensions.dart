import 'package:htmdart/src/path_registry.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'http_method.dart';

extension HxRouterExtensions on Router {
  void getHtml(String route, Handler handler) {
    PathRegistry().registerPath(route, HttpMethod.get, handler);
    get(route, handler);
  }

  void postHtml(String route, Handler handler) {
    PathRegistry().registerPath(route, HttpMethod.post, handler);
    post(route, handler);
  }

  void putHtml(String route, Handler handler) {
    PathRegistry().registerPath(route, HttpMethod.put, handler);
    put(route, handler);
  }

  void deleteHtml(String route, Handler handler) {
    PathRegistry().registerPath(route, HttpMethod.delete, handler);
    delete(route, handler);
  }

  void patchHtml(String route, Handler handler) {
    PathRegistry().registerPath(route, HttpMethod.patch, handler);
    patch(route, handler);
  }
}
