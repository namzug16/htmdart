import 'package:htmleez/htmleez.dart';

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
      meta([charset("UTF-8")]),
      title(["Htmleez Demo".t]),
      link([rel("stylesheet"), href("https://cdn.jsdelivr.net/npm/daisyui/dist/full.css")]),
    ]),
    body([
      id("main_body"),
      header([
        "Welcome to Htmleez Demo".h1(),
        nav([
          ul([
            for (final link in links)
              li([
                a([
                  if (link.active) className("btn btn-active"),
                  if (!link.active) className("btn"),
                  href(link.url),
                  link.label.t,
                ])
              ])
          ]),
        ]),
      ]),
      mainTag([
        section([
          "About This Demo".h2(),
          "This document is generated using Htmleez. It demonstrates dynamic navigation, a full HTML structure including head, body, header, main content, and footer, as well as inline scripting.".p(),
        ]),
      ]),
      footer(["© 2025 Htmleez Demo. All rights reserved.".p()]),
      script([Raw("console.log('Htmleez document loaded successfully');")])
    ])
  ]);

  final renderer = HtmlRenderer();

  final renderedHtml = renderer([document]);

  print(renderedHtml);
}
