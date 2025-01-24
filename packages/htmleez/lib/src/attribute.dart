import 'markup_component.dart';

final class Attribute {
  const Attribute(this.name);

  final String name;

  MarkupComponent call(String content) {
    return AttributeMarkupComponent(name, content);
  }
}

final class AttributeMarkupComponent extends MarkupComponent {
  final String name;
  final String content;

  const AttributeMarkupComponent(this.name, this.content);
}
