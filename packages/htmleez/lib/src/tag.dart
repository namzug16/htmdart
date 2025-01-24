import 'markup_component.dart';

final class Tag {
  const Tag(this.name, [this.isVoid = false]);

  final String name;
  final bool isVoid;

  TagMarkupComponent call(List<MarkupComponent> content) {
    final tag = TagMarkupComponent(name, isVoid, [], []);

    for (var i = 0; i < content.length; i++) {
      tag.appendChild(content[i]);
    }

    return tag;
  }
}

final class TagMarkupComponent extends MarkupComponent {
  final String name;
  final bool isVoid;
  final List<MarkupComponent> attributes;
  final List<MarkupComponent> content;

  TagMarkupComponent(
    this.name,
    this.isVoid,
    this.attributes,
    this.content,
  );
}
