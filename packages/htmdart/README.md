![htmdart](https://raw.githubusercontent.com/namzug16/htmdart/master/assets/htmdart.png)

Build fast, hypermedia-driven web apps with Dart + HTMX

## Index

- [Introduction](#introduction)
- [Choosing a backend](#choosing-a-backend)
  - [Quick start with Netto](#quick-start-with-netto)
  - [Lightweight `dart:io` server](#lightweight-dartio-server)
- [Core utilities](#core-utilities)
  - [HTMX attributes](#htmx-attributes)
  - [Hyperscript attribute](#hyperscript-attribute)
  - [HTML composition](#html-composition)
- [Additional resources](#additional-resources)

## Introduction

Htmdart gives you only the essentials you need to **compose interactive hypermedia experiences in Dart with Htmx**:

- Typed helpers for every [htmx](https://htmx.org/) attribute (`hx-*`).
- A first-class Dart wrapper for the [`_` hyperscript attribute](https://hyperscript.org/docs/#attributes).
- Tight integration with [htmleez](https://pub.dev/packages/htmleez) so you can build HTML with familiar Dart code.

Bring your own HTTP stack and combine htmdart with the backend that makes sense for your project. We love using [Netto](https://pub.dev/packages/netto), but the tooling also works great with `dart:io`, Shelf, or any framework that can return HTML strings.

## Choosing a backend

Htmdart does not lock you into a server or routing abstraction. Use it wherever you can/want

### Quick start with Netto

```dart
import "dart:io";

import "package:htmdart/htmdart.dart";
import "package:netto/netto.dart";

Future<void> main() async {
  final app = Netto()
    ..get(
      "/",
      (ctx) => ctx.response.html(
        html([
          head([
            script([
              $src("https://unpkg.com/htmx.org@2.0.4"),
            ]),
          ]),
          body([
            h1(["Hello from htmdart + Netto".t]),
            button([
              $hx.post("/clicked"),
              "Click me".t,
            ]),
          ]),
        ]).toHtml(),
      ),
    )
    ..post(
      "/clicked",
      (ctx) => ctx.response.html(
        div([
          $hx.swapOob.yes,
          "Button clicked!".t,
        ]).toHtml(),
      ),
    );

  await app.serve(InternetAddress.anyIPv4, 8080);
}
```

### Lightweight `dart:io` server

Prefer sticking to the standard library? Check out `example/io_example.dart` for a self-contained sample.

## Core utilities

### HTMX attributes

The `$hx` namespace provides fluent builders for every htmx attribute:

- **Requests**
  ```dart
  $hx.get("/path");
  $hx.post("/submit");
  $hx.delete("/resource");
  ```
- **Response behaviour**
  ```dart
  $hx.swap.innerHTML;
  $hx.swapOob.yes; // out-of-band swaps. hx-swap-oob="true"
  $hx.trigger("revealed");
  ```
- **Advanced controls**
  ```dart
  $hx.vals("js:{ count: … }");
  $hx.valsMap({"count": 10}); // Accepts a Map<String, dynamic> that then will be encoded to json
  $hx.select(".result");
  $hx.confirm("Are you sure?");
  ```

Every helper renders to the exact attribute htmx expects.

### Hyperscript attribute

Hyperscript plays nicely with htmx. Use the `$_` helper to attach scripts directly from your Dart code:

```dart
button([
  $class("btn"),
  $_("on click add .active to me then wait 500ms then remove .active"),
  "Click me".t,
]);
```

### HTML composition

Htmdart builds on top of [htmleez](https://pub.dev/packages/htmleez) a declarative, composable HTML builder for Dart.
With htmleez, every HTML component is a Dart callable class, attributes and other tags are passed as arguments, and text nodes use the `.t` helper.

```dart
final doc = html([
  head([
    title(["Ping demo".t]),
  ]),
  body([
    h1(["Hello".t]),
    button([
      $hx.get("/ping"),
      "Ping".t,
    ]),
  ]),
]);
```

## Additional resources

- Browse the [examples](../../examples) directory for runnable demos.
