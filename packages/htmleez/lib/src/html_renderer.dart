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
      case TagHtmlComponent():
        _renderTag(html, sb);
      case HtmlComponentSet():
        _renderComponentSet(html, sb);
    }
    return sb.toString();
  }

  void _renderTag(TagHtmlComponent tag, StringBuffer sb) {
    sb.write("<${tag.name}");

    for (int i = 0; i < tag.attributes.length; i++) {
      final e = tag.attributes[i];
      switch (e) {
        case AttributeHtmlComponent():
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
          case TagHtmlComponent():
            _renderTag(e, sb);
          case Text():
            sb.write(HtmlComponent.escapeString(e.text));
          case UnsafeRaw():
            sb.write(e.content);
        }
      }

      sb.write("</${tag.name}>");
    }
  }

  void _renderAttribute(AttributeHtmlComponent a, StringBuffer sb) {
    final name = a.name;
    final content = a.content;
    if (name == content) {
      sb.write(' $name');
    } else {
      if (content.contains('"')) {
        sb.write(" $name='$content'");
      } else {
        sb.write(' $name="$content"');
      }
    }
  }

  void _renderComponentSet(HtmlComponentSet set, StringBuffer sb) {
    for (int i = 0; i < set.components.length; i++) {
      final e = set.components[i];
      if (e is! TagHtmlComponent) {
        throw Exception(
            "Component Set Child is not a valid tag ${e.runtimeType}");
      }
      _renderTag(e, sb);
    }
  }
}
