import "dart:async";

import "package:shelf/shelf.dart";
import "package:htmdart/htmdart.dart";

final router = Router()
  ..notFoundHandler((req) => "404".h1().response)
  ..get("/", homePageHandler)
  ..post("/increase_counter", increaseCounterHandler)
  ..post("/decrease_counter", decreaseCounterHandler);


Response homePageHandler(Request request) {
  return html([
    script([src("https://unpkg.com/htmx.org@2.0.4")]),
    link([rel("stylesheet"), href("index.css")]),
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
