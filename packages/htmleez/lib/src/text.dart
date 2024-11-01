import 'element.dart';

final class Text implements Element {
  const Text(this.text);

  final String text;

  @override
  void render(StringBuffer sb) {
    sb.write(' ${Element.escapeString(text)}');
  }
}

extension HtmlText on String {
  Element get t => Text(this);
}
