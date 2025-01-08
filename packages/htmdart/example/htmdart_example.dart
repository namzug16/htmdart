import 'dart:async';

import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

final router = Router()
  ..getHtml("/", homeHandler)
  ..postHtml("/add", homeContentHandler);

Future<void> main() async {
  final server = await io.serve(
    Pipeline().addMiddleware(logRequests()).addHandler(router.call),
    'localhost',
    8080,
  );

  print('Serving at http://${server.address.host}:${server.port}');
}

Response homeHandler(Request request) {
  return HtmlResponse.ok(
    html([
      script([src("https://unpkg.com/htmx.org@2.0.4")]),
      div([
        counter(0),
      ]),
    ]),
  );
}

Response homeContentHandler(Request request) {
  final c = request.url.queryParameters["count"] ?? "0";

  return HtmlResponse.ok(
    hx.oobSwap(
      counter(
        int.parse(c) + 1,
      ),
    ),
  );
}

HTML counter(int count) => div([
      id("counter"),
      homeContentHandler.hxResolve(
        queryParameters: {
          "count": count.toString(),
        },
      ),
      h1([count.toString().t]),
      button([
        "+1".t,
        type("submit"),
      ]),
    ]);
