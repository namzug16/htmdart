//
// ignore_for_file: avoid_returning_this

import "dart:convert";

import "package:htmleez/src/attribute.dart";
import "package:htmleez/src/tag.dart";

/// Defines components for the "SGML family"
/// SGML: Standard Generalized Markup Language
/// HTML, XML, and SGML
abstract class MarkupComponent {
  const MarkupComponent();

  static String escapeString(String string) => const HtmlEscape().convert(string);

  MarkupComponent add(MarkupComponent c) {
    if (this is TagMarkupComponent) {
      switch (c) {
        case AttributeMarkupComponent():
          (this as TagMarkupComponent).attributes.add(c);
        default:
          (this as TagMarkupComponent).content.add(c);
      }
    } else {
      throw Exception("Cannot add child to a non Tag component. Component of type ${c.runtimeType}");
    }

    return this;
  }
}
