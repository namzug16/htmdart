import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/components/base_page.dart';
import 'package:htmdart_site/src/components/navbar.dart';
import 'package:htmdart_site/src/docs/docs_footer.dart';
import 'package:shelf/shelf.dart';

Response Function(Request) pageDocsHandler(
  List<HTML> content,
  (String, String)? previous,
  (String, String)? next,
) {
  return (Request request) {
    return HtmlResponse.ok(
      basePage(
        body([
          className("h-screen"),
          div([
            className("flex flex-col h-full"),
            navbar,
            div([
              className("flex flex-1 overflow-hidden gap-2"),
              hx.boost("true"),
              _docsSidebar,
              div([
                className("flex-1 prose max-w-none p-8 overflow-y-auto"),
                ...content,
                docsFooter(
                  previous,
                  next,
                ),
              ]),
            ]),
          ]),
          script([UnsafeRaw("Prism.highlightAll();")]),
        ]),
      ),
    );
  };
}

final _docsSidebar = ul([
  id("docs-sidebar"),
  className("menu bg-base-200 overflow-y-auto block min-w-64"),
  "Documentation".h3.className("text-base font-bold pb-4"),
  li([
    "Getting Started".h2.className("menu-title"),
    ul([
      li([
        a([href("/docs"), "Introduction".t])
      ]),
      li([
        a([href("/docs/quick_start"), "Quick Start".t])
      ]),
    ]),
  ]),
  li([
    "Htmleez".h2.className("menu-title"),
    ul([
      li([
        a([href("/docs/htmleez"), "Introduction".t])
      ]),
      li([
        a([href("/docs/htmleez/components"), "Components".t])
      ]),
      li([
        a(["Tags".t])
      ]),
      li([
        a(["Attributes".t])
      ]),
      li([
        a(["Events and Commands".t])
      ]),
      li([
        a(["Text".t])
      ]),
      li([
        a(["Unsafe Raw".t])
      ]),
    ]),
  ]),
]);
