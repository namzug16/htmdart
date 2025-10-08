import "package:htmleez/src/html_component.dart";

final class Tag {
  //
  // ignore: avoid_positional_boolean_parameters
  const Tag(this.name, [this.isVoid = false]);

  final String name;
  final bool isVoid;

  TagComponent call(List<HtmlComponent> content) {
    final tag = TagComponent(name, isVoid, [], []);

    for (var i = 0; i < content.length; i++) {
      tag.add(content[i]);
    }

    return tag;
  }
}

final class TagComponent extends HtmlComponent {
  TagComponent(
    this.name,
    //
    // ignore: avoid_positional_boolean_parameters
    this.isVoid,
    this.attributes,
    this.content,
  );

  final String name;
  final bool isVoid;
  final List<HtmlComponent> attributes;
  final List<HtmlComponent> content;
}
