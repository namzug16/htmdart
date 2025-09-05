import "package:htmdart/src/router/builder.dart";
import "package:htmdart/src/router/utils.dart";
import "package:shelf/shelf.dart";

class Group extends Builder {
  Group(super._parent, super.rTree, String prefix, Middleware? middleware) : prefix = normalizePath(prefix) {
    if (middleware != null) {
      use(middleware);
    }
  }

  final String prefix;

  @override
  void add(String verb, String route, Function handler) {
    super.add(verb, "$prefix$route", handler);
  }

  @override
  Group group(String prefix, [Middleware? middleware]) {
    return super.group("${this.prefix}$prefix", middleware);
  }
}
