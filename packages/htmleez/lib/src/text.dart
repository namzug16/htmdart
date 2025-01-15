import 'package:htmleez/htmleez.dart';

import 'tags.dart' as tags;
import 'attributes.dart' as attr;

final class Text extends HtmlComponent {
  const Text(this.text);

  final String text;
}

extension HtmlText on String {
  HtmlComponent get t => Text(this);
  HtmlComponent get h1 => tags.h1([t]);
  HtmlComponent get h2 => tags.h2([t]);
  HtmlComponent get h3 => tags.h3([t]);
  HtmlComponent get h4 => tags.h4([t]);
  HtmlComponent get h5 => tags.h5([t]);
  HtmlComponent get h6 => tags.h6([t]);
  HtmlComponent get p => tags.p([t]);
  HtmlComponent code([String className = ""]) => tags.pre([tags.code([attr.className(className), t])]);
  HtmlComponent get span => tags.span([t]);
  Command get js => SimpleCommand(this);
}
