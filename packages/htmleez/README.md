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
  print(HtmlRenderer().render(btn()));
}

HTML btn() => button([
    $type("button"),
    $class("btn btn-primary"),
    $onclick("console.log('Clicked')"),
    "Click me!".t
  ]);

```

## Core Concepts
- **Tags, Attributes and Events**: simple way to mirror HTML elements in Dart.
```dart
const div = Tag("div");
const img = Tag("img", true); // renders a void tag <img />
/// Attributes always start with a "$" in order to differentiate them from Tags
const $id = Attribute("id");
const $onclick = RawAttribute("onclick"); // `RawAttribute` does not escape the value
```

- **Text & Raw**: 
  - Safe text: `.t` escapes HTML in text. `div(["Hello".t])` -> `<div>Hello</div>`
  - Raw content: `Raw()` inserts unescaped content. `script([Raw("alert("Hi")")])` -> `<script>alert("Hi")</script>`

- **Text Extensions**: Quick markup helpers on strings
  - `"Title".h1()` -> `<h1>Title</h1>`
  - `"Text".p("text-muted")` -> `<p class="text-muted">Text</p>`

- **API**: 
  - `<HTML>.add()` to append children after creation.

For the full list of tags, attributes, events and extensions, see the [API Reference](https://pub.dev/documentation/htmleez/latest/).
