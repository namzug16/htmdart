```dart
Result helloHandler(Request request) {
    return HtmlResponse.ok(
        html([
            h1(["Hello There!".t]),
        ]),
    );
}
```

