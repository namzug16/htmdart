class PathRegistry {
  factory PathRegistry() => _instance;

  PathRegistry._internal();

  static final PathRegistry _instance = PathRegistry._internal();

  final Map<Function, (String, String)> _handlerPaths = {};

  void registerPath(String path, String method, Function handler) {
    final p = _handlerPaths[handler];
    if (p != null) {
      throw Exception("Handler already registered for path: $path, http mehtod: $method");
    }
    _handlerPaths[handler] = (method, path);
  }

  (String, String) getMethodAndPath(Function handler) {
    final mp = _handlerPaths[handler];

    if (mp == null) {
      throw Exception("Handler has not been registered in the Router. $handler");
    }

    return mp;
  }
}
