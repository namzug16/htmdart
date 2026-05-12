# Htmdart - LLM Reference

Htmdart provides Dart utilities for building hypermedia-driven web apps with [HTMX](https://htmx.org/). It extends htmleez with typed helpers for HTMX attributes, hyperscript integration, and server-side hypermedia patterns.

## Quick Start

```dart
import "package:htmdart/htmdart.dart";

// HTMX-powered button
button([
  $hx.post("/api/submit"),
  $hx.trigger("click"),
  "Submit".t,
])
```

Render with any backend that returns HTML strings:

```dart
div([
  h1(["Hello from htmdart".t]),
  button([
    $hx.get("/ping"),
    "Ping".t,
  ]),
]).toHtml()
```

## HTMX Attributes (`$hx`)

The `$hx` namespace provides fluent builders for all HTMX attributes.

### HTTP Verbs

```dart
$hx.get("/path")        // hx-get="/path"
$hx.post("/submit")     // hx-post="/submit"
$hx.put("/update")      // hx-put="/update"
$hx.patch("/patch")     // hx-patch="/patch"
$hx.delete("/remove")   // hx-delete="/remove"
```

### Response Targeting

```dart
$hx.target("#result")           // hx-target="#result"
$hx.select(".content")          // hx-select=".content"
$hx.swap.innerHTML              // hx-swap="innerHTML"
$hx.swap.outerHTML              // hx-swap="outerHTML"
$hx.swapOob.yes                 // hx-swap-oob="true" (out-of-band)
```

**Swap options:** `innerHTML`, `outerHTML`, `textContent`, `beforebegin`, `afterbegin`, `beforeend`, `afterend`, `delete`, `none`

### Triggers

```dart
$hx.trigger("click")                    // hx-trigger="click"
$hx.trigger("every 5s")                 // hx-trigger="every 5s"
$hx.trigger("load")                     // hx-trigger="load"
$hx.events.afterSwap                    // hx-trigger="htmx:afterSwap"
```

### Values and Parameters

```dart
$hx.vals("js:{ count: 0 }")              // Raw JS values
$hx.valsMap({"count": 10})               // Map converted to JSON
$hx.params("POST")                       // hx-params="POST"
$hx.include("#search-form")              // hx-include="#search-form"
```

### Advanced Controls

```dart
$hx.confirm("Are you sure?")            // Shows confirm() dialog
$hx.prompt("Enter your name")           // Shows prompt() dialog
$hx.boost                             // hx-boost (progressive enhancement)
$hx.history("false")                    // hx-history (disable for element)
$hx.preserve                           // hx-preserve (keep element across swaps)
$hx.sync("#form")                       // hx-sync (synchronize requests)
```

### Request Configuration

```dart
$hx.headers({"X-Custom": "value"})      // Custom headers
$hx.ext("ext-name")                     // HTMX extension
$hx.request("{\"timeout\": 5000}")       // Full request config
$hx.encoding                            // hx-encoding
$hx.validate                            // hx-validate
$hx.disabledElt("#submit-btn")          // hx-disabled-elt
```

## HTMX Events (`$hx.events`)

Access HTMX lifecycle events for wiring logic:

```dart
$hx.events.afterSettle        // htmx:afterSettle
$hx.events.afterSwap          // htmx:afterSwap
$hx.events.afterRequest       // htmx:afterRequest
$hx.events.afterOnLoad        // htmx:afterOnLoad
$hx.events.beforeSend         // htmx:beforeSend
$hx.events.beforeSwap         // htmx:beforeSwap
$hx.events.beforeRequest      // htmx:beforeRequest
$hx.events.confirm            // htmx:confirm (can cancel request)
$hx.events.configRequest      // htmx:configRequest (modify request)
$hx.events.targetError        // htmx:targetError
$hx.events.swapError          // htmx:swapError
$hx.events.responseError      // htmx:responseError
$hx.events.timeout            // htmx:timeout
$hx.events.historyRestore     // htmx:historyRestore
```

See `hx_events.dart` for all 40+ events.

## HTMX Response Headers (`HX`)

Server-side constants for HTMX response headers:

```dart
HX.trigger         // "HX-Trigger" - trigger client events
HX.triggerAfterSettle  // "HX-Trigger-After-Settle"
HX.triggerAfterSwap    // "HX-Trigger-After-Swap"
HX.retarget        // "HX-Retarget" - change swap target
HX.reselect        // "HX-Reselect" - change select selector
HX.reswap          // "HX-Reswap" - change swap method
HX.location        // "HX-Location" - client-side redirect
HX.pushUrl         // "HX-Push-Url" - push history
HX.redirect        // "HX-Redirect" - HTTP redirect
HX.refresh         // "HX-Refresh" - full page refresh
HX.replaceUrl      // "HX-Replace-Url"
```

## Hyperscript (`$_`)

Add [hyperscript](https://hyperscript.org) behavior to elements:

```dart
button([
  $_("on click add .active to me then wait 500ms then remove .active"),
  "Click me".t,
])
```

Hyperscript integrates well with HTMX for rich client-side interactions.

## Example: Full HTMX Page

```dart
html([
  head([
    title(["HTMX Demo".t]),
    script([$src("https://unpkg.com/htmx.org@2.0.4")]),
  ]),
  body([
    h1(["Counter Demo".t]),
    div([$id("counter"), "0".t]),
    button([
      $hx.post("/increment"),
      $hx.target("#counter"),
      $hx.swap.innerHTML,
      $("aria-label")("Increment counter"),
      "Increment".t,
    ]),
  ]),
]).toHtml()
```

## Example: Out-of-Band Swap

```dart
// Server returns this to update multiple elements at once
div([
  $hx.swapOob.yes,
  "Updated content".t,
])
```

## Example: Form with Validation

```dart
form([
  $hx.post("/submit"),
  $hx.trigger("change"),
  $hx.validate,
  input([$name("email"), $type("email"), $required]),
  button([$type("submit"), "Submit".t]),
])
```

## Server-Side Header Usage

When returning HTMX responses from a server:

```dart
// In your server handler
response.headers.set(HX.trigger, "myEvent");
response.headers.set(HX.retarget, "#other-element");
```

## File Structure

```
lib/
├── htmdart.dart          # Re-exports htmleez + hx + hyperscript
└── src/
    ├── hx.dart           # $hx namespace + HX headers
    ├── hx_events.dart    # $hx.events constants
    ├── hx_swap.dart      # HxSwap class for swap options
    └── hyperscript.dart  # $_ hyperscript helper
```

## Dependencies

- `htmleez` (required): Provides the HTML builder primitives

## Notes

- Htmdart is backend-agnostic - use with Netto, shelf, dart:io, or any framework returning HTML
- All HTMX attributes render to exact `hx-*` attribute names
- `$hx.valsMap()` automatically JSON-encodes Map values
- `$_` uses `RawAttribute` so hyperscript code is passed through unchanged
- Combine with `htmleez` text extensions (`"text".t`, `"text".p()`) for clean composition