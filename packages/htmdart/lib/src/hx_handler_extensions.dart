import 'package:htmdart/src/http_method.dart';
import 'package:htmdart/src/hx.dart';
import 'package:htmdart/src/path_registry.dart';
import 'package:htmleez/htmleez.dart';
import 'package:shelf/shelf.dart';

extension HxHandlerExtensions on Handler {
  HTML hxResolve({
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    final mp = PathRegistry().getMethodAndPath(this, queryParameters);

    String path = mp.$2;

    if (pathParameters != null) {
      for (final pp in pathParameters.entries) {
        path = path.replaceAll("<${pp.key}>", pp.value);
      }
    }

    if (path.contains("<") || path.contains(">")) {
      throw Exception("Missing path parameters for ${mp.$2}. Got $path");
    }

    return switch (mp.$1) {
      HttpMethod.get => hx.get(path),
      HttpMethod.post => hx.post(path),
      HttpMethod.put => hx.put(path),
      HttpMethod.delete => hx.delete(path),
      HttpMethod.patch => hx.patch(path),
    };
  }
}
