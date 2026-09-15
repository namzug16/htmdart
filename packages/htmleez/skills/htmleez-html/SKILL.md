---
name: htmleez-html
description: >-
  Use when writing, modifying, or reviewing Dart code that builds HTML with
  package:htmleez. Applies to server-rendered HTML, reusable htmleez component
  functions, form markup, fragments, attributes, data-* and ARIA attributes,
  escaping, raw HTML, and rendering htmleez nodes to strings. Do not use for
  generic Dart or HTML tasks that are not using htmleez.
---

# Htmleez HTML

## Core Model

- Import `package:htmleez/htmleez.dart`.
- Build markup as `HTML` nodes. Use the exported `HTML` typedef for reusable component return types.
- Tags are callable constants. Call them with one positional `List<HTML>` containing both attributes and children: `div([$("id")("main"), "Hello".t])`.
- Render with `.toHtml()` on an `HTML` value, `FragmentComponent`, or `List<HTML>`.
- The `html([...]).toHtml()` renderer automatically prefixes `<!DOCTYPE html>`.

## Required Patterns

- Prefer explicit tag constants such as `div`, `p`, `a`, `form`, `input`, `button`, `html`, `head`, and `body`.
- Use `mainTag` for `<main>` and `varTag` for `<var>` because `main` and `var` conflict with Dart names.
- Use string `.t` for text nodes. Text is escaped during rendering.
- Use `$("name")("value")` for normal attributes. Attribute values are escaped during rendering.
- Use `$("name")()` for flag/boolean attributes such as `required`, `disabled`, `checked`, and `autofocus`.
- Use `$("data-user-id")(...)`, `$("aria-label")(...)`, and other exact HTML attribute names for `data-*`, ARIA, custom, and framework attributes.
- Use `$classes(["a", "b"])` only when joining a list of CSS class names is clearer than `$("class")("a b")`.
- Use Dart collection `if` and `for` inside the tag list for conditional children, conditional attributes, and repeated elements.
- Use `HTML.fragment([...])` when multiple sibling nodes need to be returned or inserted without a wrapper.
- Use `const Raw(...)` only for trusted static raw HTML, CSS, or JS that must not be escaped.
- Use `raw$("onclick")("...")` only for trusted static raw attribute content, commonly inline event handlers. Never pass user input to `Raw` or `raw$`.

## Avoid

- Do not invent named parameters like `div(children: ..., attrs: ...)`; htmleez tags take one positional list.
- Do not use JSX, React component semantics, browser DOM mutation APIs, or unrelated HTML-builder packages.
- Do not manually concatenate HTML strings when htmleez nodes can express the markup.
- Do not use removed legacy convenience APIs such as string `.h1()`, `.p()`, `.span()`, exported attribute constants, event constants, or ARIA constants when writing htmleez 1.0 code.
- Do not put attributes at the root of a document or fragment. Attributes are only valid inside a tag's list.
- Do not put children inside void elements such as `br`, `img`, `input`, `meta`, `link`, and `hr`; the renderer outputs them as self-closing tags.

## Example

```dart
import "package:htmleez/htmleez.dart";

typedef NavItem = ({String label, String href, bool active});

HTML page(List<NavItem> items, String email) => html([
  head([
    meta([$("charset")("UTF-8")]),
    title(["Account".t]),
  ]),
  body([
    nav([
      ul([
        for (final item in items)
          li([
            a([
              $("href")(item.href),
              if (item.active) $("class")("active"),
              if (item.active) $("aria-current")("page"),
              item.label.t,
            ]),
          ]),
      ]),
    ]),
    form([
      $("method")("post"),
      $("data-form")("account"),
      label([$("for")("email"), "Email".t]),
      input([
        $("id")("email"),
        $("name")("email"),
        $("type")("email"),
        $("value")(email),
        $("required")(),
      ]),
      button([$("type")("submit"), "Save".t]),
    ]),
  ]),
]);

final htmlString = page([], "a@example.com").toHtml();
```

## More Detail

- Read [references/patterns.md](references/patterns.md) when you need examples for fragments, collections, reusable components, custom tags, raw content, void elements, or rendering multiple roots.
