![htmdart](https://raw.githubusercontent.com/namzug16/htmdart/master/assets/htmdart.png)

Build fast, hypermedia-driven web apps with Dart + htmx

## Index

- [Introduction](#introduction)
- [Hello World Example](#hello-world-example)
- [Core Concepts](#core-concepts)
  - [HTMX Utilities](#1-htmx-utilities)
  - [Hyperscript Attribute](#2-hyperscript-attribute)
  - [Router](#3-router)

## Introduction

Htmdart was born out of a simple need: **to move fast when building hypermedia-driven web applications in Dart**. While frameworks like `shelf` (or newer ones like `relic`) provide excellent foundations, they often lack certain conveniences that make everyday development smooth.  

That’s why Htmdart gives you:  

- **Direct HTML rendering in Dart** - powered by the separate [htmleez](https://pub.dev/packages/htmleez) package, so you can compose markup anywhere.  
- **Attributes for htmx & hyperscript** - all the `hx-*` and `_` attributes available as htmleez attributes.
- **A router built for speed & DX** - radix-tree based, with grouping, middlewares, static file serving, and redirects included out of the box.  
- **A custom `serve` function** - wrapping `shelf_io.serve`, with extras like hot-reload and opinionated defaults.  

These tools are not meant to reinvent the Dart web ecosystem. They exist because, today, **the existing solutions aren’t yet at the level where building a complete hypermedia app feels frictionless**. Htmdart fills that gap.  

### Looking Ahead  

The long-term vision of Htmdart is actually to become **smaller**, not bigger.  
- The essential piece is **attribute helpers** (htmx, hyperscript, etc.) - those are stable and unlikely to change.  
- Routers, serve utilities, or other abstractions may be deprecated in the future, once Dart’s web frameworks mature enough to cover these features well.  

In short: **Htmdart is a bridge** - giving you the speed and ergonomics you need right now, while leaving room for you to adopt other frameworks as they evolve.  

## Hello World Example

```dart
import "dart:io";
import "dart:math";
import 'package:htmdart/htmdart.dart';

final router = Router()
  ..get("/", homePage)
  ..get("/random", randomNumber);

void main() => serve(router, InternetAddress.anyIPv4, 8080, withHotreload: false);

Response homePage(Request _) => respondWithHtml([
  html([
    body([
      div([$id("number"), "0".t]),
      button([
        $hx.get("/random"),
        "Get Random Number".t,
      ]),
    ]),
  ]),
]);

Response randomNumber(Request _) => respondWithHtmlOob([
  div([
    $id("number"),
    Random().nextInt(100).toString().t,
  ]),
]);
```

## Core Concepts

### 1 HTMX utilities

The `hx` class provides all the standard HTMX attributes

- **Simple verbs**  
  ```dart
  hx.get("/path")
  hx.post("/submit")
  hx.put(...)
  hx.delete(...)
  ```
- **Dynamic handler binding**  
  ```dart
  // Let's imagine this handler
  Response handleNoteDetails(Request req, String noteId) {...}

  final router = Router()..get("/notes/<noteId>",  handleNoteDetails);

  // Then in your elements you can automatically pick up the HTTP verb and route
  $hx.handle(handleNoteDetails)

  // In case your route has path parameters (like in this case)
  // you can pass them in order as a List<String>
  $hx.handler(handleNoteDetails, [note.id])

  // You can also pass query parameters
  $hx.handler(handleNoteDetails, [note.id], {"fromQP": true})

  // It renders to
  // hx-get="/notes/myNoteId?fromQP=true";
  ```
- **Swap controls**  
  ```dart
  $hx.swap.innerHTML
  $hx.swapOob.yes      // out-of-band swaps
  ```
- **Extras**  
  ```dart
  $hx.vals("js:{ count: … }")      // inject JSON values
  $hx.select(".result")            // response selector
  $hx.confirm("Are you sure?")
  ```
  All the available hx attributes from [htmx](https://htmx.org/) have been added, you can see them [here](https://github.com/namzug16/htmdart/blob/master/packages/htmdart/lib/src/hx.dart)

### 2 Hyperscript attribute

Built-in support for [hyperscript](https://hyperscript.org/)'s attribute

```dart
div([
  className("btn"),
  $_("on click add .active to me then wait 500ms then remove .active"),
  "Click me".t,
])
```

### 3 Router

```dart
final router = Router()
  ..notFoundHandler((req) => html([h1(["404".t])]).response)
  ..get("/", homePageHandler)
  ..post("/increment", incrementHandler);

void main() async {
  final server = await io.serve(router.call, 'localhost', 8080);
  print("Listening on ${server.port}");
}
```

- **Path parameters**
  ```dart
  Response handler(Request req, String param) {...}

  final router = Router()..get("/handler/<param>", handler);
  ```
- **Any Method**
  ```dart
  Response handler(Request req, String param) {
    switch(req.method) {
      case "GET": ...
      case "POST": ...
    }
  }

  final router = Router()..any("/any", handler);
  ```
- **Grouping**
  ```dart
  final apiGroup = router.group("/api");
  apiGroup.get("/items", listItems);
  apiGroup.post("/items", createItem);
  ```
- **Static files**
  ```dart
  router.static("/public", "web/public");
  ```
- **Middleware**
  - Built-in support for middlewares with `router.use(myMiddleware)`
- **Redirects**
  Redirect not defined routes with
  ```dart
  router.redirect("/", "/login"),
  ```

### 4. Helpers

- **Response shortcuts**  
  - `respondWithHtml([...])`: wraps a list of `HTML` fragments into a full `Response` with the correct `Content-Type`.
  - `respondWithHtmlOob([...])`: same as above, but optimized for *out-of-band* swaps in htmx (adds `$hx.swapOob.yes` to all the fragments).

- **Request extensions**  
  On any `Request` you can check htmx metadata:  
  ```dart
  if (request.isHx) { ... }          // true if HX-Request == "true"
  print(request.hxTarget);           // target element
  print(request.hxTriggerName);      // trigger name
