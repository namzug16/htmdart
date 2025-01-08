import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

final router = Router()
  ..getHtml("/", homePageHandler)
  ..postHtml("/increase_counter", increaseCounterHandler)
  ..postHtml("/decrease_counter", decreaseCounterHandler);

Response homePageHandler(Request request) {
  return HtmlResponse.ok(
    html([
      lang("en"),
      meta([charset("UTF-8")]),
      meta([name("viewport"), content("width=device-width, initial-scale=1.0")]),
      meta([name("X-UA-Compatible"), content("ie=edge")]),
      title(["{{name}}".t]),
      script([src("https://unpkg.com/htmx.org@1.9.2")]),
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
    ]),
  );
}

Future<Response> increaseCounterHandler(Request request) async {
  final fd = Uri.splitQueryString(await request.readAsString());

  final c = fd["count"] ?? "0";

  return HtmlResponse.ok(
    hx.oobSwap(
      counter(
        int.parse(c) + 1,
      ),
    ),
  );
}

Future<Response> decreaseCounterHandler(Request request) async {
  final fd = Uri.splitQueryString(await request.readAsString());

  final c = fd["count"] ?? "0";

  return HtmlResponse.ok(
    hx.oobSwap(
      counter(
        int.parse(c) - 1,
      ),
    ),
  );
}

HTML counter(int count) => h1([
      id("counter"),
      className("text-9xl font-bold"),
      count.toString().t,
    ]);

final counterActions = div([
  className("flex gap-4"),
  button([
    className("btn btn-primary"),
    hx.swap(swapNone),
    hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    decreaseCounterHandler.hxResolve(),
    "-1".t,
  ]),
  button([
    className("btn btn-primary"),
    hx.swap(swapNone),
    hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    increaseCounterHandler.hxResolve(),
    "+1".t,
  ]),
]);
