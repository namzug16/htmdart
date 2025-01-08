import 'package:shelf/shelf.dart';

import 'http_method.dart';

class PathRegistry {
  PathRegistry._internal();
  static final PathRegistry _instance = PathRegistry._internal();
  factory PathRegistry() => _instance;

  final Map<Handler, (HttpMethod, String)> _handlerPaths = {};

  void registerPath(String path, HttpMethod method, Handler handler) {
    final p = _handlerPaths[handler];
    if (p != null) {
      throw Exception(
        "HTML handler already registered for path: $path, http mehtod: $method",
      );
    }
    _handlerPaths[handler] = (method, path);
  }

  (HttpMethod, String) getMethodAndPath(
    Handler handler,
    Map<String, dynamic>? qs,
  ) {
    final mp = _handlerPaths[handler];

    final sb = StringBuffer();

    if (mp == null) {
      throw Exception(
          "Handler has not been registered in the Router or it might have been registered as a standard handler. $handler");
    }

    sb.write(mp.$2);

    if (qs != null) {
      sb.write("?");
      for (final (i, param) in qs.entries.indexed) {
        sb.write(
            "${param.key}=${param.value}${i == qs.entries.length - 1 ? "" : "&"}");
      }
    }

    return (mp.$1, sb.toString());
  }
}
