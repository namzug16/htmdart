<div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
<span style="font-size: 6rem; font-weight: bold;">html<span style="color: #00FF00">eez</span></span>
<p>HTML easy</p>
<p style="display: none">HTML deez nuts</p>
</div>

# Overview 
## Introduction

Template-less. Type safe. Simple. Familiar. Pure Dart.

Htmleez is a lightweight library that helps you build HTML in pure Dart in a simple and familiar way (it feels like HTML but in Dart!)

```dart
final myButton = button([
  type("button"),
  className("btn btn-primary"),
  onclick("console.log('Button clicked!')"),
  "Click me!".t,
]);
```
# Getting Started 
## Installation

```
dart pub get htmleez
```

## Example

```dart
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
        "Welcome to Htmleez Demo".h1,
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
          "About This Demo".h2,
          "This document is generated using Htmleez. It demonstrates dynamic navigation, a full HTML structure including head, body, header, main content, and footer, as well as inline scripting.".p,
        ]),
      ]),
      footer(["© 2025 Htmleez Demo. All rights reserved.".p]),
      script([Raw("console.log('Htmleez document loaded successfully');")])
    ])
  ]);

  final renderer = HtmlRenderer();

  final renderedHtml = renderer([document]);

  print(renderedHtml);
}
```
# Core Concepts
## Components 

All the `Tag` and `Attributes` have been taken from the [MDM reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference)

### Tag

A `Tag` can be created as such

```dart
const div = Tag("div");

/// Self-closing tag / void tag
const img = Tag("img", true);
```
Then it can be used like this

```dart
const component = div([div([div([])])]);
```

A `Tag` will accept any type of `HTML` element (`Tag`, `Attribute`, `Text`, `Raw`)

### Attributes
Attributes work in a similar way 

```dart
const href = Attribute("href");
```

But once they need to be used, they can only accept a string or nothing ([for boolean attributes](https://developer.mozilla.org/en-US/docs/Glossary/Boolean/HTML))

```dart
final crossorigin = Attribute("crossorigin");

crossorigin() // renders to => crossorigin

crossorigin("anonymous") // renders to => crossorigin="anonymous"
```

Some attributes have a similar name to either a `Tag` or to a protected word by the language, in order to avoid 
conflicts `Attr` has been added at the end of the name. 

This is the entire list of attributes with a custom name.

```dart
const asAttr = Attribute("as");
const asyncAttr = Attribute("async");
const citeAttr = Attribute("cite");
const dataAttr = Attribute("data");
const defaultAttr = Attribute("default");
const forAttr = Attribute("for");
const formAttr = Attribute("form");
const labelAttr = Attribute("label");
const slotAttr = Attribute("slot");
const spanAttr = Attribute("span");
const styleAttr = Attribute("style");
const summaryAttr = Attribute("summary");
const titleAttr = Attribute("title");
const isAttr = Attribute("is");
```

### Text

Text can only be formed with extensions, like so 

```dart
final component = div(["This is a simple text inside html".t]);

// This will render to 
// <div>This is a simple text inside html<div/>
```
This allows us to identify rapidly in our HTML components what should be just text and what should not.

### Raw

Htmleez is designed to prevent user-provided data from being used to inject vulnerabilities (HTML Client Injection Attacks).

All the `Text` and value of an `Attribute` will be automatically escaped.

In case you'd like to add "Raw" content of any type, you can use the `Raw` component.

```dart
final component = script([
  Raw("console.log('Hello World')"),
]);
```
This is especially useful when implementing your own `script` or `style`.

Events follow a similar approach. An event inside HTML is defined as an attribute
whose value is valid javascript, so for that `RawAttribute` exists

```dart
const onclick = RawAttribute("onclick");

final component = button([
  type("button"),
  onclick("console.log('clicked')"),
  "Click me!".t,
]);
```

## Render the components

The rendered component will be minified by default

```dart
final component = div([...]);

final renderer = HtmlRenderer();

print(renderer.render(component));
```

# API reference
## Text Extensions

Htmleez exposes a small set of extensions to use in string in order to build fast text components

```dart
extension MarkupText on String {
  MarkupComponent get h1 => tags.h1([t]);
  MarkupComponent get h2 => tags.h2([t]);
  MarkupComponent get h3 => tags.h3([t]);
  MarkupComponent get h4 => tags.h4([t]);
  MarkupComponent get h5 => tags.h5([t]);
  MarkupComponent get h6 => tags.h6([t]);
  MarkupComponent get p => tags.p([t]);
  MarkupComponent get span => tags.span([t]);
}

final component = div([
  "h1".h1,
  "p".p,
  "span".span,
  span([
    "a".span,
    "b".span,
    "c".span,
  ]),
]);
```
## Component Methods & Extensions

### Add method

If you'd like to add a new component child to a component that has already been created, you can use the method `.add()`

```dart
HTML primaryButton(String label) => button([
  type("button"),
  className("btn btn-primary"),
  label.t,
]);

final component = primaryButton("Click me!").add(onclick("console.log('Button Clicked')"));

/// Will render to 
/// <button type="button" class="btn btn-primary" onclick="console.log('Button Clicked')">Click me!</button>

```
> ! You can only add new elements to a `Tag`, if you try to add an element to an 
> `Attribute`, you will get an exception.

### Class Extension

When creating text in your components you might need to add styles to them, so instead of writing something like this

```dart
final component = div([
  span([
    "a".span,
    "b".span.add(className("font-bold text-red")),
    "c".span,
  ]),
]);
```

You can directly use the `className` extension

```dart
final component = div([
  span([
    "a".span,
    "b".span.className("font-bold text-red"),
    "c".span,
  ]),
]);
```

## Special Components

### ID

ID can be used in two ways, as an attribute

```dart
div([
  id("my_id"),
])
```

And as a component


`id.component<T>(String id, HTML Function(T param) builder)`

Giving you access to the ID of a component without having to create a separate variable
or building the component every time you need the ID


```dart
final myComponent = id.component<(String,)>(
  "my_component_id",
  (params) => div([params.$1.t]),
);

div([
  myComponent(("Hello World!",)),
  button([
    "Goodbye World!".t,
    onclick("document.getElementById('${myComponent.id}').remove()"),
  ]),
])
```
