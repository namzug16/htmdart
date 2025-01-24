import 'dart:convert';

import 'attribute.dart';
import 'tag.dart';

/// Defines components for the "SGML family"
/// SGML: Standard Generalized Markup Language
/// HTML, XML, and SGML
abstract class MarkupComponent {
  const MarkupComponent();

  static String escapeString(String string) => HtmlEscape().convert(string);

  MarkupComponent appendChild(MarkupComponent e) {
    if (this is TagMarkupComponent) {
      switch (e) {
        case AttributeMarkupComponent():
          (this as TagMarkupComponent).attributes.add(e);
        case MarkupComponentSet():
          for (var i = 0; i < e.components.length; i++) {
            appendChild(e.components[i]);
          }
          break;
        default:
          (this as TagMarkupComponent).content.add(e);
      }
    } else {
      throw Exception("Cannot append child to non Tag component");
    }

    return this;
  }
}

final class MarkupComponentSet extends MarkupComponent {
  const MarkupComponentSet(this.components);
  final List<MarkupComponent> components;
}
