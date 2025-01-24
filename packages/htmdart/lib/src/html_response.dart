import 'dart:io';

import 'package:htmleez/htmleez.dart';
import 'package:shelf/shelf.dart';

class HtmlResponse extends Response {
  static Map<String, Object> _htmlHeaders(Map<String, Object>? headers) {
    const defValue = "text/html; charset=utf-8";

    Map<String, Object> hs = {};

    if (headers != null) {
      hs = {...headers};
    }

    hs[HttpHeaders.contentTypeHeader] = defValue;

    return hs;
  }

  HtmlResponse.ok(
    HTML body, {
    Map<String, Object>? headers,
    Map<String, Object>? context,
  }) : super.ok(
          HtmlRenderer().render(body),
          headers: _htmlHeaders(headers),
          context: context,
        );
}
