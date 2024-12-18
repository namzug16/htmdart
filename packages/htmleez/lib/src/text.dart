import 'html_component.dart';

final class Text extends HtmlComponent {
  const Text(this.text);

  final String text;
}

extension HtmlText on String {
  HtmlComponent get t => Text(this);
}
