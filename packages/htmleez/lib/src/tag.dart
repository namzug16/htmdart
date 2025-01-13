import 'html_component.dart';

final class Tag {
  const Tag(this.name, [this.isVoid = false]);

  final String name;
  final bool isVoid;

  HtmlComponent call(List<HtmlComponent> content) {
    final tag = TagHtmlComponent(name, isVoid, [], []);

    for (var i = 0; i < content.length; i++) {
      tag.appendChild(content[i]);
    }

    return tag;
  }
}

final class TagHtmlComponent extends HtmlComponent {
  final String name;
  final bool isVoid;
  final List<HtmlComponent> attributes;
  final List<HtmlComponent> content;

  TagHtmlComponent(
    this.name,
    this.isVoid,
    this.attributes,
    this.content,
  );
}
