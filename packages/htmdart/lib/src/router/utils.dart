void checkPath(String path) {
  if (!path.startsWith('/')) throw ArgumentError.value(path, 'route', 'expected route to start with a slash');
  if (path != "/" && path.endsWith("/")) throw ArgumentError.value(path, 'route', 'expected route to not end with a slash');
}
