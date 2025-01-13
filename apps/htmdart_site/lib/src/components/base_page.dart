import 'package:htmdart/htmdart.dart';

HTML basePage(HTML body) => html([
      Attribute("data-theme")("htmdart"),
      className("[&_pre]:rounded-box line-numbers"),
      hx.ext("preload"),
      head([
        lang("en"),
        meta([charset("UTF-8")]),
        meta([name("viewport"), content("width=device-width, initial-scale=1.0")]),
        meta([name("X-UA-Compatible"), content("ie=edge")]),
        title(["htmdart site".t]),
        link([rel("stylesheet"), href("/index.css")]),
        link([rel("stylesheet"), href("/prism.css")]),
        link([rel("preconnect"), href("https://fonts.googleapis.com")]),
        link([rel("preconnect"), href("https://fonts.gstatic.com"), crossOrigin]),
        link([rel("stylesheet"), href("https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"), crossOrigin]),
        script([src("https://unpkg.com/htmx.org@1.9.2")]),
        script([src("https://unpkg.com/htmx-ext-preload@2.1.0/preload.js")]),
        script([src("/prism.js")]),
      ]),
      body,
    ]);
