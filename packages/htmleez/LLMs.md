# Htmleez - LLM Reference

Htmleez is a pure Dart library for programmatically building HTML. It provides a typed, composable API that mirrors HTML structure using Dart's callable classes.

## Quick Start

```dart
import "package:htmleez/htmleez.dart";

// Create a simple button
final button = btn([$type("button"), $class("btn"), "Click me".t]);

// Render to HTML string
print(button.toHtml()); // <button class="btn">Click me</button>
```

## Core Concepts

### Tags (Elements)

Tags are callable classes that create HTML elements. Pass children as positional arguments.

```dart
div([child1, child2])           // <div>...</div>
span(["text".t])                // <span>text</span>
a([$href("/"), "Link".t])       // <a href="/">Link</a>
img([$src("img.png"), $alt("img")]) // <img src="img.png" alt="img"/>
```

**Void tags** (self-closing) accept a second `true` parameter:
```dart
img([$src("x.png")])  // <img src="x.png"/>
br()                  // <br/>
```

All available tags: `html`, `head`, `body`, `div`, `span`, `p`, `a`, `button`, `form`, `input`, `label`, `select`, `textarea`, `table`, `tr`, `td`, `th`, `ul`, `ol`, `li`, `h1`-`h6`, `script`, `style`, `meta`, `link`, `img`, `iframe`, `video`, `audio`, `svg`, and 60+ more.

### Attributes

Attributes start with `$` to differentiate them from tags. Pass as positional arguments to tags.

```dart
div([$class("container"), $id("main"), $style("color:red")])
```

**Creating custom attributes:**
```dart
$("aria-label")("Close")  // aria-label="Close"
$data_("user-id")("123")  // data-user-id="123"
```

**Common attributes:**
- `$class`, `$id`, `$style`, `$title`, `$lang`
- `$href`, `$src`, `$alt`, `$width`, `$height`
- `$type`, `$name`, `$value`, `$placeholder`
- `$disabled`, `$readonly`, `$required`, `$checked`
- `$onclick`, `$onchange`, `$oninput`, `$onsubmit` (see Events below)

### Events

Event handlers use `RawAttribute` (values are not escaped):

```dart
button([
  $onclick("console.log('clicked')"),
  "Click".t,
])
```

Common events: `$onclick`, `$ondblclick`, `$onmouseover`, `$onkeydown`, `$onfocus`, `$onblur`, `$oninput`, `$onchange`, `$onsubmit`, `$onload`, `$onscroll`

### Aria Attributes

Use the `$aria` namespace:

```dart
div([$aria.label("Navigation"), $aria.expanded("true")])
```

Available: `$aria.label`, `$aria.labelledby`, `$aria.describedby`, `$aria.hidden`, `$aria.disabled`, `$aria.expanded`, `$aria.checked`, `$aria.selected`, `$aria.pressed`, `$aria.current`, `$aria.live`, `$aria.atomic`, `$aria.busy`, and 30+ more.

### Text and Escaping

Use `.t` on strings for HTML-safe text:

```dart
"Hello <World>".t  // renders as: Hello &lt;World&gt;
```

For raw (unescaped) content:

```dart
Raw("<script>alert(1)</script>")
```

### Text Extensions (Markup Helpers)

String extensions for quick element creation:

```dart
"Title".h1()                    // <h1>Title</h1>
"Title".h1("text-center")       // <h1 class="text-center">Title</h1>
"Paragraph".p()                 // <p>Paragraph</p>
"Paragraph".p("muted")          // <p class="muted">Paragraph</p>
"Label".span("text-muted")      // <span class="text-muted">Label</span>
```

### Fragments

Group multiple elements without a wrapper:

```dart
HtmlComponent.fragment([div1, div2, div3])
```

Or use the `List<HtmlComponent>.toHtml()` extension for rendering multiple roots.

### Classes Helper

Join multiple CSS classes:

```dart
$classes(["btn", "btn-primary"])  // class="btn btn-primary"
```

## API Reference

### `HTML` Type Alias

The unified type for all htmleez components:

```dart
typedef HTML = HtmlComponent;
```

### `toHtml()` Method

Render any component to an HTML string:

```dart
div([span(["text"])]).toHtml()
```

### `.add()` and `.addAll()`

Append children to a tag after creation:

```dart
final el = div([]);
el.add(child1);
el.addAll([child2, child3]);
```

### HTML Escape

Static method for escaping user input:

```dart
HtmlComponent.escapeString(userInput)  // safe for text nodes
```

## File Structure

```
lib/
├── htmleez.dart          # Main exports
└── src/
    ├── tag.dart          # Tag and TagComponent classes
    ├── tags.dart         # All HTML tag constants (60+)
    ├── attribute.dart    # Attribute and RawAttribute classes
    ├── attributes.dart   # All attribute constants
    ├── events.dart       # Event handler attributes
    ├── aria_attributes.dart  # ARIA attributes
    ├── text.dart         # Text class and String extensions
    ├── raw.dart          # Raw content for unescaped insertion
    ├── html_component.dart   # Base HtmlComponent class and HTML typedef
    ├── fragment_component.dart  # Fragment grouping
    └── component_to_html.dart   # Rendering logic
```

## Common Patterns

### Form
```dart
form([
  label([$for("email"), "Email".t]),
  input([$type("email"), $id("email"), $name("email"), $required]),
  button([$type("submit"), "Submit".t]),
])
```

### List
```dart
ul([
  li(["Item 1".t]),
  li(["Item 2".t]),
  li(["Item 3".t]),
])
```

### Table
```dart
table([
  thead([tr([th(["Col 1".t]), th(["Col 2".t])])]),
  tbody([
    tr([td(["Data 1".t]), td(["Data 2".t])]),
  ]),
])
```

## Notes

- All tags and attributes are `const` for optimal performance
- Tags that are Dart keywords are renamed (e.g., `varTag` for `<var>`, `mainTag` for `<main>`)
- Void elements (self-closing) have `isVoid = true`: `area`, `br`, `col`, `embed`, `hr`, `img`, `input`, `link`, `meta`, `source`, `track`, `wbr`
- `script` and `style` tags use `Raw()` for content to avoid escaping CSS/JS