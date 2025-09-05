void checkPath(String path) {
  if (!path.startsWith("/")) throw ArgumentError.value(path, "route", "expected route to start with a slash");
  if (path != "/" && path.endsWith("/")) throw ArgumentError.value(path, "route", "expected route to not end with a slash");
}

String normalizePath(String path) {
  if (path == "") return "/";
  if (path == "/") return path;

  String p = path;

  if (p[0] != "/") p = "/$p";

  if (p.endsWith("/")) return p.substring(0, p.length - 1);

  return p;
}
