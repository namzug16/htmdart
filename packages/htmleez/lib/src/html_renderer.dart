import 'attribute.dart';
import 'html_component.dart';
import 'tag.dart';
import 'text.dart';
import 'unsafe_raw.dart';

abstract class HtmlRenderer {
  String render(HTML html);
}

final class DefaultHtmlRenderer implements HtmlRenderer {
  @override
  String render(HTML html) {
    final sb = StringBuffer();
    sb.write('<!DOCTYPE html> ');
    switch (html) {
      case Tag():
        _renderTag(html, sb);
      case ElementSet():
        _renderComponentSet(html, sb);
    }
    return sb.toString();
  }

  void _renderTag(Tag tag, StringBuffer sb) {
    tag.ensureInitialized();

    sb.write("<${tag.name}");

    for (int i = 0; i < tag.attributes!.length; i++) {
      final e = tag.attributes![i];
      switch (e) {
        case Attribute():
          _renderAttribute(e, sb);
        default:
          throw Exception("Not valid attribute, ${e.runtimeType}");
      }
    }

    sb.write(">");

    if (!tag.isVoid) {
      for (int i = 0; i < tag.content!.length; i++) {
        final e = tag.content![i];
        switch (e) {
          case Tag():
            _renderTag(e, sb);
          case Text():
            sb.write(' ${HtmlComponent.escapeString(e.text)}');
          case UnsafeRaw():
            sb.write(' ${e.content}');
        }
      }

      sb.write("</${tag.name}>");
    }
  }

  void _renderAttribute(Attribute a, StringBuffer sb) {
    a.ensureInitialized();
    final name = a.name;
    final content = a.content;
    if (name == content) {
      sb.write(' $name');
    } else {
      if (content!.contains('"')) {
        sb.write(" $name='$content'");
      } else {
        sb.write(' $name="$content"');
      }
    }
  }

  void _renderComponentSet(ElementSet set, StringBuffer sb) {
    for (int i = 0; i < set.elements.length; i++) {
      final e = set.elements[i];
      if (e is! Tag) {
        throw Exception(
            "Component Set Child is not a valid tag ${e.runtimeType}");
      }
      _renderTag(e, sb);
    }
  }
}
