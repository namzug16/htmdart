import "package:routeez/src/utils.dart";

class RadixNode<T> {
  RadixNode(this.prefix, this.value);

  String prefix;
  T? value;
  final List<RadixNode<T>> children = [];
  bool get isParam => prefix.startsWith(":");
}

class RadixResult<T> {
  RadixResult(this.value, this.params);

  final T value;
  final Map<String, String> params;
}

class RadixTree<T> {
  final RadixNode<T> _root = RadixNode<T>("", null);

  void insert(String path, T value) {
    final segments = _splitPath(normalizePath(path));
    _insert(_root, segments, value);
  }

  void _insert(RadixNode<T> node, List<String> segments, T value) {
    if (segments.isEmpty) {
      if (node.value != null) {
        throw Exception("Duplicate route");
      }
      node.value = value;
      return;
    }

    final segment = segments.first;

    for (final child in node.children) {
      final sameLiteral = child.prefix == segment;
      final bothParams = child.isParam && segment.startsWith(":");

      if (sameLiteral || bothParams) {
        if (bothParams && child.prefix != segment) {
          throw Exception("Conflicting parameter names at segment: '${child.prefix}' vs '$segment'");
        }
        _insert(child, segments.sublist(1), value);
        return;
      }
    }

    final newNode = RadixNode<T>(segment, null);
    node.children.add(newNode);
    _insert(newNode, segments.sublist(1), value);
  }

  RadixResult<T>? get(String path) {
    final segments = _splitPath(normalizePath(path));
    return _get(_root, segments);
  }

  RadixResult<T>? _get(RadixNode<T> node, List<String> segments) {
    if (segments.isEmpty) {
      return node.value != null ? RadixResult<T>(node.value as T, {}) : null;
    }

    final segment = segments.first;

    //NOTE: route resolution priority
    final children = [...node.children]..sort((a, b) => a.isParam ? 1 : -1);

    for (final child in children) {
      if (child.prefix == segment) {
        final result = _get(child, segments.sublist(1));
        if (result != null) return result;
      } else if (child.isParam) {
        final result = _get(child, segments.sublist(1));
        if (result != null) {
          return RadixResult<T>(
            result.value,
            {
              child.prefix.substring(1): segment,
              ...result.params,
            },
          );
        }
      }
    }

    return null;
  }

  RadixResult<T>? getLongestLiteralMatch(String path) {
    final segments = _splitPath(path);
    return _getLongestLiteral(_root, segments);
  }

  RadixResult<T>? _getLongestLiteral(RadixNode<T> node, List<String> segments) {
    RadixResult<T>? bestMatch;

    if (node.value != null) {
      bestMatch = RadixResult<T>(node.value as T, {});
    }

    if (segments.isEmpty) return bestMatch;

    final segment = segments.first;

    for (final child in node.children) {
      if (child.prefix == segment) {
        final result = _getLongestLiteral(child, segments.sublist(1));
        if (result != null) return result;
      }
    }

    return bestMatch;
  }

  List<String> _splitPath(String path) {
    return path.split("/").where((s) => s.isNotEmpty).toList();
  }

String getTreeString() {
  final buffer = StringBuffer();

  void buildNodeString(RadixNode<T> node, String indent) {
    final valueStr = node.value != null ? " => ${node.value}" : "";
    buffer.writeln("$indent${node.prefix}$valueStr");
    for (final child in node.children) {
      buildNodeString(child, "$indent  ");
    }
  }

  buildNodeString(_root, "");
  return buffer.toString();
}
}
