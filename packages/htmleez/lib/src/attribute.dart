import "package:htmleez/src/markup_component.dart";

final class Attribute {
  const Attribute(this.name);

  final String name;

  MarkupComponent call([String? content]) {
    return EscapedAttributeMarkupComponent(name, content);
  }
}

/// The content will not be escaped, this is useful when using JS inside events
/// ! It should only be used with static content and not with user input
final class RawAttribute {
  const RawAttribute(this.name);

  final String name;

  MarkupComponent call([String? content]) {
    return EscapedAttributeMarkupComponent(name, content);
  }
}

final class EscapedAttributeMarkupComponent extends AttributeMarkupComponent {
  const EscapedAttributeMarkupComponent(super.name, super.content);
}

final class RawAttributeMarkupComponent extends AttributeMarkupComponent {
  const RawAttributeMarkupComponent(super.name, super.content);
}

sealed class AttributeMarkupComponent extends MarkupComponent {
  const AttributeMarkupComponent(this.name, this.content);

  final String name;
  final String? content;
}
