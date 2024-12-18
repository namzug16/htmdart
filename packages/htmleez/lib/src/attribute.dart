import 'html_component.dart';

final class Attribute extends HtmlComponent {
  Attribute(this.name);

  Attribute._(this.name, this.content);

  final String name;
  String? content;

  HtmlComponent call(String content) {
    return Attribute._(name, content);
  }

  @override
  void ensureInitialized() {
    if (content == null) {
      throw Exception(
        "Attribute has not been initialised. You need to call the call method for $name",
      );
    }
  }
}
