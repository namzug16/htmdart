import "package:htmleez/htmleez.dart";

typedef Link = ({String label, String url, bool active});

void main() {
  final links = <Link>[
    (label: "Home", url: "/home", active: true),
    (label: "About", url: "/about", active: false),
    (label: "Services", url: "/services", active: false),
    (label: "Contact", url: "/contact", active: false),
  ];

  final document = html([
    head([
      meta([$("charset")("UTF-8")]),
      title(["Htmleez Demo".t]),
      link([$("rel")("stylesheet"), $("href")("https://cdn.jsdelivr.net/npm/daisyui/dist/full.css")]),
    ]),
    body([
      $("id")("main_body"),
      header([
        h1(["Welcome to Htmleez Demo".t]),
        nav([
          ul([
            for (final link in links)
              li([
                a([
                  if (link.active) $("class")("btn btn-active"),
                  if (!link.active) $("class")("btn"),
                  $("href")(link.url),
                  link.label.t,
                ]),
              ]),
          ]),
        ]),
      ]),
      mainTag([
        section([
          h2(["About This Demo".t]),
          p(["This document is generated using Htmleez. It demonstrates dynamic navigation, a full HTML structure including head, body, header, main content, and footer, as well as inline scripting.".t]),
        ]),
      ]),
      footer([p(["© 2025 Htmleez Demo. All rights reserved.".t])]),
      script([const Raw("console.log('Htmleez document loaded successfully');")]),
    ]),
  ]);

  //
  // ignore: avoid_print
  print(document.toHtml());
}
