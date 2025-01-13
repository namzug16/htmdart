import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/components/htmdart_logo.dart';

final navbar = div([
  className("navbar bg-base-100"),
  hx.boost("true"),
  div([
    className("flex-1"),
    a([
      className("btn btn-ghost btn-sm text-xl"),
      href("/"),
      htmdartLogo("text-lg"),
    ]),
  ]),
  ul([
    className("menu menu-sm menu-horizontal px-2"),
    li([
      a([href("/docs"), "Docs".t])
    ]),
    li([
      a([href("/translator"), "Html to Htmleez".t])
    ]),
  ]),
  github,
]);

final github = div([
  id("github-stars"),
  hx.preserve("true"),
  className("[&_span]:flex [&_span]:place-content-center pr-2"),
  a([
    className("github-button"),
    script([src("https://buttons.github.io/buttons.js")]),
    href("https://github.com/namzug16/htmdart"),
    Attribute("data-color-scheme")(
        "no-preference: light; light: light; dark: dark;"),
    Attribute("data-size")("large"),
    Attribute("data-show-count")("true"),
    Attribute("aria-label")("Star namzug16/htmdart on GitHub"),
    "Star".t,
  ]),
]);
