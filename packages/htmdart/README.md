![htmdart](https://raw.githubusercontent.com/namzug16/htmdart/master/assets/htmdart.png)

Htmdart combines the power of [shelf](https://pub.dev/packages/shelf), [htmx](https://htmx.org/), sometimes [hyperscript](https://hyperscript.org/) and [htmleez](https://pub.dev/packages/htmleez)
to give you the simplest and fastest way to build web applications in *pure* Dart (with a great DX too).

## Before Starting

- Make sure you're familiar with [shelf](https://pub.dev/packages/shelf) as Htmdart is built on top of it
  > shelf_router is not necessary, htmdart has its own [router](#routing)
- Make sure you're familiar with hypermedia and [htmx](https://htmx.org/)
- Check out [htmleez](https://pub.dev/packages/htmleez) in order to understand how you can compose and render your HTML directly in dart
- And make sure to read [this essay](https://htmx.org/essays/when-to-use-hypermedia/) in order to have a better idea of when to use htmx 

P.S. Check out all the very informative memes about htmx and hypermedia in [here](https://htmx.org/essays/)

In case you'd like to add interactivity to your app you can check out:
- [hyperscript](https://hyperscript.org/) which is our [*preferred option*](#3.-hyperscript-attribute)
- [alpinejs](https://alpinejs.dev/)
- and many other tools

## Install

Add to your `pubspec.yaml`:

```bash
dart pub add htmdart
```

## Hello World Example

```dart
import 'dart:math';
import 'package:htmdart/htmdart.dart'; /// htmleez is automatically imported with htmdart
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

final router = Router()
  ..get("/", homePage)
  ..get("/random", randomNumber);

Future<void> main() async {
  final server = await io.serve(router.call, 'localhost', 8080);
  print('Listening on http://${server.address.host}:${server.port}');
}

Response homePage(Request _) {
  return html([
    body([
      div([id("number"), "0".t]),
      button([
        hx.get("/random"),
        "Get Random Number".t,
      ]),
    ])
  ]).response;
}

Response randomNumber(Request _) {
  final n = Random().nextInt(100);
  return div([
    id("number"),
    hx.swapOob.yes,
    n.toString().t,
  ]).response;
}
```

## Core Concepts

### 1. HTML Responses

- **`HtmlResponse`**  
  Wraps a list of `HTML` components into a `shelf.Response` with `Content-Type: text/html; charset=utf-8`.  
  ```dart
  Response myPage(Request req) {
    return HtmlResponse([
      html([
        h1(["Hello, world!".t]),
      ]),
    ]);
  }

  //You can also use the extensions
  Response myPage(Request req) {
    return html([
      h1(["Hello, world!".t])
    ]).response;
  }
  ```
- **Extensions**  
  - On a single `HTML`: `myElement.response`  
  - On a `List<HTML>`: `myListOfElements.response`

### 2. HTMX utilities

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
  hx.handle(handleNoteDetails)

  // In case your route has path parameters (like in this case)
  // you can pass them in order as a List<String>
  hx.handler(handleNoteDetails, [note.id])

  // You can also pass query parameters
  hx.handler(handleNoteDetails, [note.id], {"fromQP": true})

  // It renders to
  // hx-get="/notes/myNoteId?fromQP=true";
  ```
- **Swap controls**  
  ```dart
  hx.swap.innerHTML
  hx.swapOob.yes      // out-of-band swaps
  ```
- **Extras**  
  ```dart
  hx.vals("js:{ count: … }")      // inject JSON values
  hx.select(".result")            // response selector
  hx.confirm("Are you sure?")
  ```
  All the available hx attributes from [htmx](https://htmx.org/) have been added, you can see them [here](https://github.com/namzug16/htmdart/blob/master/packages/htmdart/lib/src/hx.dart)

### 3. Hyperscript attribute

Built-in support for [hyperscript](https://hyperscript.org/)'s attribute

```dart
div([
  className("btn"),
  hyper("on click add .active to me then wait 500ms then remove .active"),
  "Click me".t,
])
```

Renders ->

```html
<div class="btn" _="on click add .active to me then wait 500ms then remove .active">Click me</div>
```

### 4. Request Extensions

On any `shelf.Request` you can check HTMX metadata:

```dart
if (request.isHx)         // true if HX-Request header == "true"
if (request.hxTarget != null)
print(request.hxTriggerName);
```

## Routing

Use the built-in `Router` (from `htmdart/src/router/router.dart`) to declare routes:

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
  - Built-in pretty-logging: `prettyLogMiddleware()`
- **Redirects**
  Redirect not defined routes with
  ```dart
  router.redirect("/", "/login"),
  ```

