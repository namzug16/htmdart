import 'attribute.dart';
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

  void appendChild(HtmlComponent e) {
    ensureInitialized();

    switch (e) {
      case Attribute():
        attributes!.add(e);
      case ElementSet():
        for (var i = 0; i < e.elements.length; i++) {
          appendChild(e.elements[i]);
        }
        break;
      default:
        content!.add(e);
    }
  }
}
