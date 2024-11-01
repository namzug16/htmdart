import 'dart:convert';

abstract class Element {
  const Element();

  void render(StringBuffer sb);

  static String escapeString(String string) => HtmlEscape().convert(string);
}

final class ElementSet implements Element {
  const ElementSet(this.elements);
  final List<Element> elements;

  @override
  void render(StringBuffer sb) {
    throw Exception("Element Set cannot be directly rendered");
  }
}
