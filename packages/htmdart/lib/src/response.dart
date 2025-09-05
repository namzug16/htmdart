import "dart:io";

import "package:htmdart/src/hx.dart";
import "package:htmleez/htmleez.dart";
import "package:shelf/shelf.dart";

Response _respondeWithHtml(
  List<HTML> body, {
  int statusCode = 200,
  Map<String, Object>? headers,
  Map<String, Object>? context,
}) {
  final renderer = HtmlRenderer();

  return Response(
    statusCode,
    body: renderer(body),
    headers: {...?headers, HttpHeaders.contentTypeHeader: "text/html; charset=utf-8"},
    context: context,
  );
}

/// Creates an HTTP response with an HTML body.
///
/// Accepts a list of [HTML] fragments as the body.
///
/// Example:
/// ```dart
/// return responseHtml([
///   div([
///     h1([text('Hello')]),
///   ]),
/// ]);
/// ```
Response respondWithHtml(
  List<HTML> body, {
  int statusCode = 200,
  Map<String, Object>? headers,
  Map<String, Object>? context,
}) => _respondeWithHtml(
  body,
  statusCode: statusCode,
  headers: headers,
  context: context,
);

/// Creates an HTTP response with an HTML body.
///
/// Accepts a list of [HTML] fragments as the body.
///
/// Example:
/// ```dart
/// return responseHtml([
///   div([
///     h1([text('Hello')]),
///   ]),
/// ]);
/// ```
Response respondWithHtmlOob(
  List<HTML> body, {
  int statusCode = 200,
  Map<String, Object>? headers,
  Map<String, Object>? context,
}) => _respondeWithHtml(
  body.map((e) => e.add($hx.swapOob.yes)).toList(),
  statusCode: statusCode,
  headers: headers,
  context: context,
);
