import 'package:htmdart/htmdart.dart';

HTML basePage(HTML child) => html([
      Attribute("data-theme")("retro"),
      $lang("en"),
      meta([$charset("UTF-8")]),
      meta([$name("viewport"), $content("width=device-width, initial-scale=1.0")]),
      meta([$name("X-UA-Compatible"), $content("ie=edge")]),
      title(["ToDo App HTMDART".t]),
      script([$src("https://unpkg.com/htmx.org@1.9.2")]),
      script([$src("https://unpkg.com/hyperscript.org@0.9.14")]),
      link([$rel("stylesheet"), $href("index.css")]),
      meta([$name("description"), $content("A simple ToDo app made with HTMDART")]),
      meta([$name("keywords"), $content("ToDo, tasks, HTMX, dart, HTMDART, app")]),
      child,
    ]);
