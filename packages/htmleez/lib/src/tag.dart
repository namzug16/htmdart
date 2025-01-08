import 'html_component.dart';

final class Tag extends HtmlComponent {
  Tag(this.name, this.isVoid);

  Tag._(
    this.name,
    this.isVoid,
    this.attributes,
    this.content,
  );

  final String name;
  final bool isVoid;
  List<HtmlComponent>? attributes;
  List<HtmlComponent>? content;

  HtmlComponent call(List<HtmlComponent> content) {
    final tag = Tag._(name, isVoid, [], []);

    for (var i = 0; i < content.length; i++) {
      tag.appendChild(content[i]);
    }

    return tag;
  }

  @override
  void ensureInitialized() {
    if (attributes == null || content == null) {
      throw Exception(
        "Tag has not been initialised. You need to call the call method for $name",
      );
    }
  }
}
