## 1.0.0

- feat!: simplify attributes by removing exported attribute, event, and ARIA constants
- feat!: remove string markup helpers like `.h1()`, `.p()`, and `.span()` in favor of explicit tags
- feat: use `$("name")` for escaped attributes and `raw$("name")` for raw attributes
- feat: add `selectedcontent` and verify all W3C Webref HTML elements are available as tag constants
- docs: bundle the `htmleez-html` Agent Skill with the package
- docs: update examples to the simplified attribute API

## 0.15.0

- feat: add `FragmentComponent` support for composable fragment trees
- test: add fragment rendering coverage for nested and tag-child fragment scenarios

## 0.14.0

- feat: add `$()` helper to create attributes by name

## 0.13.0

- refactor: rename `MarkupComponent` to `HtmlComponent`
- feat!: remove `HtmlRenderer` and add `toHtml` methods to `HtmlComponent`s

## 0.12.0

- feat: `addAll` method in `MarkupComponent`

## 0.11.0

- feat: Aria Attributes

## 0.10.0

- feat: Attributes' name convention

## 0.9.0

- Public release
