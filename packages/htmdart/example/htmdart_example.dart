import 'dart:async';

import 'package:htmdart/htmdart.dart';
import 'package:htmleez/htmleez.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

final router = Router()
  ..getHtml("/", homePageHandler)
  ..postHtml("/increase_counter", increaseCounterHandler)
  ..postHtml("/decrease_counter", decreaseCounterHandler);

Future<void> main() async {
  final server = await io.serve(Pipeline().addMiddleware(logRequests()).addHandler(router.call), 'localhost', 8080);

  print('Serving at http://${server.address.host}:${server.port}');
}

Response homePageHandler(Request request) {
  return HtmlResponse.ok([
    html([
      link([href("https://cdn.jsdelivr.net/npm/daisyui@4.12.23/dist/full.min.css"), rel("stylesheet"), type("text/css")]),
      script([src("https://unpkg.com/htmx.org@2.0.4")]),
      script([src("https://cdn.tailwindcss.com")]),
      body([
        className("h-screen place-content-center"),
        div([
          className("flex flex-col gap-6 items-center"),
          counter(0),
          counterActions,
        ]),
        h1([
          className("text-xs text-center mt-8"),
          "Powered by shelf and htmdart".t,
        ]),
      ]),
    ]),
  ]);
}

Future<Response> increaseCounterHandler(Request request) async {
  final fd = Uri.splitQueryString(await request.readAsString());

  final c = fd["count"] ?? "0";

  return HtmlResponse.ok([
    counter(int.parse(c) + 1).add(hx.swapOob.yes),
  ]);
}

Future<Response> decreaseCounterHandler(Request request) async {
  final fd = Uri.splitQueryString(await request.readAsString());

  final c = fd["count"] ?? "0";

  return HtmlResponse.ok([
    counter(int.parse(c) - 1).add(hx.swapOob.yes),
  ]);
}

HTML counter(int count) => h1([id("counter"), className("text-9xl font-bold"), count.toString().t]);

final counterActions = div([
  className("flex gap-4"),
  button([
    className("btn btn-primary"),
    hx.swap.none,
    hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    decreaseCounterHandler.hxResolve(),
    "-1".t,
  ]),
  button([
    className("btn btn-primary"),
    hx.swap.none,
    hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    increaseCounterHandler.hxResolve(),
    "+1".t,
  ]),
]);
