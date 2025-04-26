import "package:htmleez/src/markup_component.dart";

final class Tag {
  //
  // ignore: avoid_positional_boolean_parameters
  const Tag(this.name, [this.isVoid = false]);

  final String name;
  final bool isVoid;

  TagMarkupComponent call(List<MarkupComponent> content) {
    final tag = TagMarkupComponent(name, isVoid, [], []);

    for (var i = 0; i < content.length; i++) {
      tag.add(content[i]);
    }

    return tag;
  }
}

final class TagMarkupComponent extends MarkupComponent {
  TagMarkupComponent(
    this.name,
    //
    // ignore: avoid_positional_boolean_parameters
    this.isVoid,
    this.attributes,
    this.content,
  );

  final String name;
  final bool isVoid;
  final List<MarkupComponent> attributes;
  final List<MarkupComponent> content;
}
