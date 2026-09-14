![htmleez](https://raw.githubusercontent.com/namzug16/htmdart/master/assets/htmleez.png)

# Htmleez
**Template-less. Type safe. Simple. Familiar. Pure Dart.**

## Install

```bash
dart pub add htmleez
```

## Quick Start
```dart
import "package:htmleez/htmleez.dart";

void main() {
  print(btn().toHtml());
}

HTML btn() => button([
    $("type")("button"),
    $("class")("btn btn-primary"),
    raw$("onclick")("console.log('Clicked')"),
    "Click me!".t
  ]);

```

## Core Concepts
- **Tags, Attributes and Events**: simple way to mirror HTML elements in Dart.
```dart
const div = Tag("div");
const img = Tag("img", true); // renders a void tag <img />

$("id")("main"); // escaped attribute: id="main"
$("disabled")(); // flag attribute: disabled
raw$("onclick")("console.log('Clicked')"); // raw attribute for static JS/events
$classes(["btn", "btn-primary"]); // class="btn btn-primary"
```

- **Text & Raw**: 
  - Safe text: `.t` escapes HTML in text. `div(["Hello".t])` -> `<div>Hello</div>`
  - Raw content: `Raw()` inserts unescaped content. `script([Raw("alert('Hi')")])` -> `<script>alert('Hi')</script>`

- **Text Extension**: `"Text".t` creates escaped text content.

- **API**: 
  - `<HTML>.add()` to append children after creation.

For the full list of tags and extensions, see the [API Reference](https://pub.dev/documentation/htmleez/latest/).
