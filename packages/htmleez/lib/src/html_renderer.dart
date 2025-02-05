import 'package:htmleez/src/markup_renderer.dart';

import 'attribute.dart';
import 'markup_component.dart';
import 'tag.dart';
import 'text.dart';
import 'raw.dart';

final class HtmlRenderer implements MarkupRenderer {
  @override
  String render(MarkupComponent markup) {
    final sb = StringBuffer();
    sb.write('<!DOCTYPE html> ');
    switch (markup) {
      case TagMarkupComponent():
        _renderTag(markup, sb);
      case MarkupComponentSet():
        _renderComponentSet(markup, sb);
    }
    return sb.toString();
  }

  void _renderTag(TagMarkupComponent tag, StringBuffer sb) {
    sb.write("<${tag.name}");

    for (int i = 0; i < tag.attributes.length; i++) {
      final e = tag.attributes[i];
      switch (e) {
        case AttributeMarkupComponent():
          _renderAttribute(e, sb);
        default:
          throw Exception("Not valid attribute, ${e.runtimeType}");
      }
    }

    sb.write(">");

    if (!tag.isVoid) {
      for (int i = 0; i < tag.content.length; i++) {
        final e = tag.content[i];
        switch (e) {
          case TagMarkupComponent():
            _renderTag(e, sb);
          case Text():
            sb.write(MarkupComponent.escapeString(e.text));
          case Raw():
            sb.write(e.content);
        }
      }

      sb.write("</${tag.name}>");
    }
  }

  void _renderAttribute(AttributeMarkupComponent a, StringBuffer sb) {
    final name = a.name;
    if (a.content == null) {
      sb.write(' $name');
    } else {
      String content = switch(a) {
        EscapedAttributeMarkupComponent(:final content) => MarkupComponent.escapeString(content!),
        RawAttributeMarkupComponent(:final content) => content!,
      };

      sb.write(' $name="$content"');
    }
  }

  void _renderComponentSet(MarkupComponentSet set, StringBuffer sb) {
    for (int i = 0; i < set.components.length; i++) {
      final e = set.components[i];
      if (e is! TagMarkupComponent) {
        throw Exception(
            "Component Set Child is not a valid tag ${e.runtimeType}");
      }
      _renderTag(e, sb);
    }
  }
}
