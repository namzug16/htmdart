//
// ignore_for_file: avoid_returning_this

import "dart:convert";

import "package:htmleez/src/attribute.dart";
import "package:htmleez/src/tag.dart";

/// Unified alias for all HTML components exposed by the library.
///
/// This type represents an HTML fragment or a complete document,
/// and is intended for use by the library’s consumers when composing
/// or returning HTML content.
///
/// In practice, [HTML] can be any constructible HTML component
/// (e.g. tags, elements, or documents) built with htmleez.
typedef HTML = HtmlComponent;

/// Defines components for HTML
abstract class HtmlComponent {
  const HtmlComponent();

  static String escapeString(String string) => const HtmlEscape().convert(string);

  HtmlComponent add(HtmlComponent c) {
    if (this is! TagComponent) {
      throw UnsupportedError(
        "Cannot add child to a non-Tag parent of type $runtimeType",
      );
    }
    final t = this as TagComponent;
    switch (c) {
      case AttributeComponent():
        t.attributes.add(c);
      default:
        t.content.add(c);
    }
    return this;
  }

  HtmlComponent addAll(List<HtmlComponent> cs) {
    for (final c in cs) {
      add(c);
    }
    return this;
  }
}
