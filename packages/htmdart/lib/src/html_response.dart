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

  HtmlResponse(
    List<HTML> body, {
    int statusCode = 200,
    Map<String, Object>? headers,
    Map<String, Object>? context,
  }) : super(statusCode, body: HtmlRenderer().renderMultiple(body), headers: _htmlHeaders(headers), context: context);
}


extension HtmlExtensions on HTML {
  Response get response => HtmlResponse([this]);
}

extension HtmlListExtensions on List<HTML> {
  Response get response => HtmlResponse(this);
}
