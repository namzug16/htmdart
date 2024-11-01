import 'element.dart';

final class Attribute implements Element {
  Attribute(this.name);

  Attribute._(this.name, this._content);

  final String name;
  String? _content;

  Element call(String content) {
    return Attribute._(name, content);
  }

  @override
  void render(StringBuffer sb) {
    if (_content == null) {
      throw Exception(
        "Attribute has not been initialised. You need to call the call method for $name",
      );
    }

    if (name == _content) {
      sb.write(' $name');
    } else {
      if (_content!.contains('"')) {
        sb.write(" $name='$_content'");
      } else {
        sb.write(' $name="$_content"');
      }
    }
  }
}
