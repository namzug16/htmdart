import "package:htmleez/src/attributes.dart";
import "package:htmleez/src/markup_component.dart";
import "package:htmleez/src/tags.dart" as tags;

final class Text extends MarkupComponent {
  const Text(this.text);

  final String text;
}

extension MarkupText on String {
  MarkupComponent get t => Text(this);
  MarkupComponent h1([String? c]) => tags.h1([t, className(c)]);
  MarkupComponent h2([String? c]) => tags.h2([t, className(c)]);
  MarkupComponent h3([String? c]) => tags.h3([t, className(c)]);
  MarkupComponent h4([String? c]) => tags.h4([t, className(c)]);
  MarkupComponent h5([String? c]) => tags.h5([t, className(c)]);
  MarkupComponent h6([String? c]) => tags.h6([t, className(c)]);
  MarkupComponent p([String? c]) => tags.p([t, className(c)]);
  MarkupComponent span([String? c]) => tags.span([t, className(c)]);
}
