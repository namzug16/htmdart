import 'package:htmdart/src/http_method.dart';
import 'package:htmdart/src/hx.dart';
import 'package:htmdart/src/path_registry.dart';
import 'package:htmleez/htmleez.dart';
import 'package:shelf/shelf.dart';

extension HxHandlerExtensions on Handler {
  HTML hxResolve({
    Map<String, dynamic>? queryParameters,
  }) {
    final mp = PathRegistry().getMethodAndPath(this, queryParameters);
    return switch (mp.$1) {
      HttpMethod.get => hx.get(mp.$2),
      HttpMethod.post => hx.post(mp.$2),
      HttpMethod.put => hx.put(mp.$2),
      HttpMethod.delete => hx.delete(mp.$2),
      HttpMethod.patch => hx.patch(mp.$2),
    };
  }
}
