import 'html_component.dart';

final class Attribute {
  const Attribute(this.name);

  final String name;

  HtmlComponent call(String content) {
    return AttributeHtmlComponent(name, content);
  }
}

final class AttributeHtmlComponent extends HtmlComponent {
  final String name;
  final String content;

  const AttributeHtmlComponent(this.name, this.content);
}
