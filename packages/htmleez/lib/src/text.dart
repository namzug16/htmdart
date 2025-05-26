import "package:htmleez/src/attributes.dart";
import "package:htmleez/src/markup_component.dart";
import "package:htmleez/src/tags.dart" as tags;

final class Text extends MarkupComponent {
  const Text(this.text);

  final String text;
}

extension MarkupText on String {
  MarkupComponent get t => Text(this);
  MarkupComponent h1([String? c]) => tags.h1([t, $class(c)]);
  MarkupComponent h2([String? c]) => tags.h2([t, $class(c)]);
  MarkupComponent h3([String? c]) => tags.h3([t, $class(c)]);
  MarkupComponent h4([String? c]) => tags.h4([t, $class(c)]);
  MarkupComponent h5([String? c]) => tags.h5([t, $class(c)]);
  MarkupComponent h6([String? c]) => tags.h6([t, $class(c)]);
  MarkupComponent p([String? c]) => tags.p([t, $class(c)]);
  MarkupComponent span([String? c]) => tags.span([t, $class(c)]);
}
