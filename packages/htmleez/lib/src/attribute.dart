import "package:htmleez/src/html_component.dart";

final class Attribute {
  const Attribute(this.name);

  final String name;

  HtmlComponent call([String? content]) {
    return EscapedAttributeComponent(name, content);
  }
}

/// The content will not be escaped, this is useful when using JS inside events
/// ! It should only be used with static content and not with user input
final class RawAttribute {
  const RawAttribute(this.name);

  final String name;

  HtmlComponent call([String? content]) {
    return EscapedAttributeComponent(name, content);
  }
}

final class EscapedAttributeComponent extends AttributeComponent {
  const EscapedAttributeComponent(super.name, super.content);
}

final class RawAttributeComponent extends AttributeComponent {
  const RawAttributeComponent(super.name, super.content);
}

sealed class AttributeComponent extends HtmlComponent {
  const AttributeComponent(this.name, this.content);

  final String name;
  final String? content;
}
