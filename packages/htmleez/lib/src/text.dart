import "package:htmleez/src/attributes.dart";
import "package:htmleez/src/html_component.dart";
import "package:htmleez/src/tags.dart" as tags;

final class Text extends HtmlComponent {
  const Text(this.text);

  final String text;
}

extension HtmlText on String {
  HtmlComponent get t => Text(this);
  HtmlComponent h1([String? c]) => tags.h1([t, $class(c)]);
  HtmlComponent h2([String? c]) => tags.h2([t, $class(c)]);
  HtmlComponent h3([String? c]) => tags.h3([t, $class(c)]);
  HtmlComponent h4([String? c]) => tags.h4([t, $class(c)]);
  HtmlComponent h5([String? c]) => tags.h5([t, $class(c)]);
  HtmlComponent h6([String? c]) => tags.h6([t, $class(c)]);
  HtmlComponent p([String? c]) => tags.p([t, $class(c)]);
  HtmlComponent span([String? c]) => tags.span([t, $class(c)]);
}
