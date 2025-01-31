import 'markup_component.dart';
import 'tags.dart' as tags;
import 'attributes.dart' as attr0;

final class Text extends MarkupComponent {
  const Text(this.text);

  final String text;
}

extension MarkupText on String {
  MarkupComponent get t => Text(this);
  MarkupComponent get h1 => tags.h1([t]);
  MarkupComponent get h2 => tags.h2([t]);
  MarkupComponent get h3 => tags.h3([t]);
  MarkupComponent get h4 => tags.h4([t]);
  MarkupComponent get h5 => tags.h5([t]);
  MarkupComponent get h6 => tags.h6([t]);
  MarkupComponent get p => tags.p([t]);
  MarkupComponent code([String className = ""]) => tags.pre([tags.code([attr0.className(className), t])]);
  MarkupComponent get span => tags.span([t]);
}
