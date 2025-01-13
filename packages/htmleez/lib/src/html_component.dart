import 'dart:convert';

import 'attribute.dart';
import 'tag.dart';

typedef HTML = HtmlComponent;

abstract class HtmlComponent {
  const HtmlComponent();

  static String escapeString(String string) => HtmlEscape().convert(string);

  HtmlComponent appendChild(HtmlComponent e) {
    if (this is TagHtmlComponent) {
      switch (e) {
        case AttributeHtmlComponent():
          (this as TagHtmlComponent).attributes.add(e);
        case HtmlComponentSet():
          for (var i = 0; i < e.components.length; i++) {
            appendChild(e.components[i]);
          }
          break;
        default:
          (this as TagHtmlComponent).content.add(e);
      }
    } else {
      throw Exception("Cannot append child to non Tag component");
    }

    return this;
  }
}

final class HtmlComponentSet extends HtmlComponent {
  const HtmlComponentSet(this.components);
  final List<HtmlComponent> components;
}
