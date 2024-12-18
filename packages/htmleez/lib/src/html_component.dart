import 'dart:convert';

typedef HTML = HtmlComponent;

abstract class HtmlComponent {
  const HtmlComponent();

  void ensureInitialized() {}

  static String escapeString(String string) => HtmlEscape().convert(string);
}

//FIX: rename to component
final class ElementSet extends HtmlComponent {
  const ElementSet(this.elements);
  final List<HtmlComponent> elements;
}
