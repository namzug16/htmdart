import "package:htmdart/src/router/builder.dart";
import "package:htmdart/src/router/utils.dart";
import "package:shelf/shelf.dart";

class Group extends Builder {
  Group(super._parent, super.rTree, String? prefix, Middleware? middleware) : prefix = prefix != null ? normalizePath(prefix) : null {
    if (middleware != null) {
      use(middleware);
    }
  }

  final String? prefix;

  @override
  void add(String verb, String route, Function handler) {
    super.add(verb, [?prefix, route].join(), handler);
  }

  @override
  Group group(String? prefix, [Middleware? middleware]) {
    final p = [?this.prefix, ?prefix].join();
    return super.group(p.isEmpty ? null : p, middleware);
  }
}
