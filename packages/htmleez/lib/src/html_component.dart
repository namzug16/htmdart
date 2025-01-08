import 'dart:convert';

import 'attribute.dart';
import 'tag.dart';

typedef HTML = HtmlComponent;

abstract class HtmlComponent {
  const HtmlComponent();

  void ensureInitialized() {}

  static String escapeString(String string) => HtmlEscape().convert(string);

  void appendChild(HtmlComponent e) {
    ensureInitialized();

    if (this is Tag) {
      switch (e) {
        case Attribute():
          (this as Tag).attributes!.add(e);
        case HtmlComponentSet():
          for (var i = 0; i < e.components.length; i++) {
            appendChild(e.components[i]);
          }
          break;
        default:
          (this as Tag).content!.add(e);
      }
    } else {
      throw Exception("Cannot append child to non Tag component");
    }
  }
}

final class HtmlComponentSet extends HtmlComponent {
  const HtmlComponentSet(this.components);
  final List<HtmlComponent> components;
}
