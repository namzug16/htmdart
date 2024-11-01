import 'hx_router.dart';

class PathRegistry {
  PathRegistry._internal();
  static final PathRegistry _instance = PathRegistry._internal();
  factory PathRegistry() => _instance;

  final Map<HxElementHandler, String> _handlerPaths = {};

  void registerPath(HxElementHandler handler, String path) {
    _handlerPaths[handler] = path;
  }

  String getPath(HxElementHandler handler, Map<String, dynamic>? qs) {
    String? p = _handlerPaths[handler];

    if (p == null) {
      throw Exception(
          "Handler has not been registered in the Router. $handler");
    }

    if (qs != null) {
      for (final q in qs.keys) {
        p = p!.replaceAll(q, qs[q]);
      }
    }

    return p!;
  }
}
