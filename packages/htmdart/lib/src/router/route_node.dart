import "package:htmdart/src/router/utils.dart";
import "package:shelf/shelf.dart";

final _pathParamMatcher = RegExp("<([^>]+)>");

class RouteNode {
  RouteNode({required this.segment});

  final String segment;
  Function? handler;
  Middleware? middleware;

  final Map<String, RouteNode> literalChildren = {};

  RouteNode? routeParameterChild;

  String? get routeParameterName => _pathParamMatcher.firstMatch(segment)?.group(1);

  static List<String> parsePath(String path) {
    checkPath(path);
    return path.split("/").where((s) => s.isNotEmpty).toList();
  }

  void insertPath(String verb, String path, Function handler, Middleware? middleware) {
    _checkPathParameters(path);
    final segments = parsePath(path);
    _insertSegments([verb, ...segments], handler, middleware);
  }

  void _insertSegments(List<String> segments, Function handler, Middleware? middleware) {
    if (segments.isEmpty) {
      this.handler = handler;
      this.middleware = middleware;
      return;
    }

    final seg = segments.first;

    if (_pathParamMatcher.hasMatch(seg)) {
      final ppn = _pathParamMatcher.firstMatch(seg)!.group(1);
      if (routeParameterChild != null) {
        if (routeParameterChild!.routeParameterName != ppn) {
          throw Exception("Conflicting route parameter: existing parameter <${routeParameterChild!.routeParameterName}> does not match specified parameter $seg");
        }
        routeParameterChild!._insertSegments(segments.sublist(1), handler, middleware);
      } else {
        routeParameterChild = RouteNode(segment: seg);
        routeParameterChild!._insertSegments(segments.sublist(1), handler, middleware);
      }
    } else {
      if (literalChildren.containsKey(seg)) {
        literalChildren[seg]!._insertSegments(segments.sublist(1), handler, middleware);
      } else {
        literalChildren[seg] = RouteNode(segment: seg);
        literalChildren[seg]!._insertSegments(segments.sublist(1), handler, middleware);
      }
    }
  }

  (RouteNode, Map<String, String>)? matchPath(String verb, String path) {
    final segments = parsePath("/$path");
    return _matchSegments([verb, ...segments], {});
  }

  (RouteNode, Map<String, String>)? _matchSegments(List<String> segments, Map<String, String> params) {
    if (segments.isEmpty) {
      if (handler != null) {
        return (this, params);
      } else {
        return null;
      }
    }

    final seg = segments.first;

    if (literalChildren.containsKey(seg)) {
      final result = literalChildren[seg]!._matchSegments(segments.sublist(1), params);
      if (result != null) return result;
    }
    if (routeParameterChild != null) {
      if (routeParameterChild!.routeParameterName case final rpn?) {
        params[rpn] = seg;
      }
      return routeParameterChild!._matchSegments(segments.sublist(1), params);
    }
    return null;
  }

  Future<Response> invoke(Request request, Map<String, String> params) async {
    // TODO(me): should I expose them?
    final r = request.change(context: {"shelf_router/params": params});

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

    if (middleware != null) {
      return middleware!(h)(r);
    }

    return h(r);
  }
}

/// Throws an error if multiple path parameters have the same name
void _checkPathParameters(String path) {
  final matches = _pathParamMatcher.allMatches(path);
  final seenParams = <String>{};

  for (final match in matches) {
    final paramName = match.group(1);
    if (paramName != null) {
      if (seenParams.contains(paramName)) {
        throw ArgumentError('Multiple path parameters with the name "$paramName" found in "$path".');
      }
      seenParams.add(paramName);
    }
  }
}
