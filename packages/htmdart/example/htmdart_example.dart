import 'dart:async';

import 'package:htmdart/htmdart.dart';
import 'package:htmleez/htmleez.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

final router = Router()
    ..notFoundHandler((req) => "404".h1().response)
    ..get("/", homePageHandler)
    ..post("/increase_counter", increaseCounterHandler)
    ..post("/decrease_counter", decreaseCounterHandler);

Future<void> main() async {
  final server = await io.serve(router.call, 'localhost', 8080);

  print('Serving at http://${server.address.host}:${server.port}');
}

Response homePageHandler(Request request) {
  return html([
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
  ]).response;
}

Future<Response> increaseCounterHandler(Request request) async {
  final fd = Uri.splitQueryString(await request.readAsString());

  final c = fd["count"] ?? "0";

  return counter(int.parse(c) + 1).add(hx.swapOob.yes).response;
}

Future<Response> decreaseCounterHandler(Request request) async {
  final fd = Uri.splitQueryString(await request.readAsString());

  final c = fd["count"] ?? "0";

  return counter(int.parse(c) - 1).add(hx.swapOob.yes).response;
}

HTML counter(int count) => h1([id("counter"), className("text-9xl font-bold"), count.toString().t]);

final counterActions = div([
  className("flex gap-4"),
  button([
    className("btn btn-primary"),
    hx.swap.none,
    hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    hx.handle(decreaseCounterHandler),
    "-1".t,
  ]),
  button([
    className("btn btn-primary"),
    hx.swap.none,
    hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    hx.handle(increaseCounterHandler),
    "+1".t,
  ]),
]);
