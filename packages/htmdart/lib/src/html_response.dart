import 'dart:io';

import 'package:htmleez/htmleez.dart';
import 'package:shelf/shelf.dart';

class HtmlResponse {
  static Response ok(
    Element html, {
    Map<String, Object>? headers,
    Map<String, Object>? context,
  }) {
    const defValue = "text/html; charset=utf-8";

    Map<String, Object> hs = {};

    if (headers != null) {
      hs = {...headers};
    }

    hs[HttpHeaders.contentTypeHeader] = defValue;

    final sb = StringBuffer();

    html.render(sb);

    return Response.ok(
      sb.toString(),
      headers: hs,
      context: context,
    );
  }
}
