import "dart:io";

import "package:htmdart/htmdart.dart";
import "package:netto/netto.dart";

Future<void> main() async {
  final app = Netto()
    ..notFoundHandler = (Ctx ctx) {
      ctx.response.html("404".h1().toHtml());
    }
    ..get("/", homePageHandler)
    ..post("/increase_counter", increaseCounterHandler)
    ..post("/decrease_counter", decreaseCounterHandler);

  await app.serve(InternetAddress.anyIPv4, 8080);
}

void homePageHandler(Ctx ctx) {
  return ctx.response.html(
    html([
      link([$href("https://cdn.jsdelivr.net/npm/daisyui@4.12.23/dist/full.min.css"), $rel("stylesheet"), $type("text/css")]),
      script([$src("https://unpkg.com/htmx.org@2.0.4")]),
      script([$src("https://cdn.tailwindcss.com")]),
      body([
        $class("h-screen place-content-center"),
        div([
          $class("flex flex-col gap-6 items-center"),
          counter(0),
          counterActions,
        ]),
        h1([
          $class("text-xs text-center mt-8"),
          "Powered by HTMDART".t,
        ]),
      ]),
    ]).toHtml(),
  );
}

Future<void> increaseCounterHandler(Ctx ctx) async {
  final c = (await ctx.request.body.formValue("count")) ?? "0";
  return ctx.response.html(counter(int.parse(c) + 1).add($hx.swapOob.yes).toHtml());
}

Future<void> decreaseCounterHandler(Ctx ctx) async {
  final c = (await ctx.request.body.formValue("count")) ?? "0";
  return ctx.response.html(counter(int.parse(c) - 1).add($hx.swapOob.yes).toHtml());
}

HTML counter(int count) => h1([$id("counter"), $class("text-9xl font-bold"), count.toString().t]);

final counterActions = div([
  $class("flex gap-4"),
  button([
    $class("btn btn-primary"),
    $hx.swap.none,
    $hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    $hx.post("/decrease_counter"),
    "-1".t,
  ]),
  button([
    $class("btn btn-primary"),
    $hx.swap.none,
    $hx.vals("js:{ count: document.getElementById('counter').textContent }"),
    $hx.post("/increase_counter"),
    "+1".t,
  ]),
]);
