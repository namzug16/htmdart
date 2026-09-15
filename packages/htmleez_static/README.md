# Htmleez Static
**Static sites. Type safe. Simple. Familiar. Pure Dart.**

Built on top of [htmleez](https://pub.dev/packages/htmleez), `htmleez_static` lets you **generate and export static websites** directly from Dart code. No templates, no extra build tools.

---

## Install

```bash
dart pub add htmleez_static
```

## Quick Start
```dart
import 'package:htmleez/htmleez.dart';
import 'package:htmleez_static/htmleez_static.dart';

void main() {
  final site = StaticSite("localhost", "public")
    ..notFoundPage(page404())
    ..page("/", pageHome())
    ..page("/info", pageInfo())
    ..page("/contact", pageContact());

  // Generate static files
  site();
}

// Shared layout
HTML basePage(List<HTML> bodyChildren) => html([
  head([
    meta([$("charset")("UTF-8")]),
    title(["My Simple Static Site".t]),
  ]),
  body(bodyChildren),
]);

HTML navLinks() => nav([
  a([$("href")("/"), "Home".t]),
  " | ".t,
  a([$("href")("/info"), "Info".t]),
  " | ".t,
  a([$("href")("/contact"), "Contact".t]),
]);

HTML pageHome() => basePage([
  navLinks(),
  h1(["Welcome to My Site".t]),
  p(["This is the homepage.".t]),
]);

HTML pageInfo() => basePage([
  navLinks(),
  h1(["Info Page".t]),
  p(["Here is some information about this site.".t]),
]);

HTML pageContact() => basePage([
  navLinks(),
  h1(["Contact Page".t]),
  p(["You can reach us at contact@example.com.".t]),
]);

HTML page404() => basePage([
  navLinks(),
  h1(["404 - Page Not Found".t]),
  p(["Oops! The page you are looking for does not exist.".t]),
]);
```

## Core Concepts
- StaticSite: Define your site, its pages, and how assets are handled.
- Pages: Each .page() maps a URL path to an HTML object (HTML) from [htmleez](https://pub.dev/packages/htmleez).
- 404 Page: .notFoundPage() lets you set a custom "not found" page.
- Asset Handling: Copy or symlink an assets directory into your output folder.
- Pure Dart: Write HTML directly in Dart using type-safe [htmleez](https://pub.dev/packages/htmleez) elements.

## Why htmleez_static?
- No templating engines - HTML is just Dart.
- No runtime dependencies - output is plain static files.
- Full control over HTML, attributes, and events thanks to [htmleez](https://pub.dev/packages/htmleez).

For the full list of features in the HTML layer, see the [htmleez](https://pub.dev/packages/htmleez) API Reference.
