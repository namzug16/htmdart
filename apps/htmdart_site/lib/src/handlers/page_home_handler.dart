import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/components/base_page.dart';
import 'package:htmdart_site/src/components/htmdart_logo.dart';
import 'package:htmdart_site/src/components/navbar.dart';
import 'package:htmdart_site/src/utils/markdown.dart';
import 'package:shelf/shelf.dart';

Future<Response> pageHomeHandler(Request request) async {
  final md = await fromMarkdown("public/md/index.md");
  return HtmlResponse.ok(
    basePage(
      body([
        navbar,
        div([
          className("h-full flex flex-col gap-6 items-center"),
          htmdartLogo("text-9xl"),
          h1(["Build simple and scalable systems with dart + shelf + htmx.".t]),
          div([
            className("[&_pre]:w-[30rem]"),
            md,
          ]),
          button([
            className("btn btn-primary"),
            "Get started".t,
          ]),
        ]),
        script([UnsafeRaw("Prism.highlightAll();")]),
      ]),
    ),
  );
}
