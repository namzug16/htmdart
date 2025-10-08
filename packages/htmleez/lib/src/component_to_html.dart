import "package:htmleez/src/attribute.dart";
import "package:htmleez/src/html_component.dart";
import "package:htmleez/src/raw.dart";
import "package:htmleez/src/tag.dart";
import "package:htmleez/src/text.dart";

extension HtmlComponentToHtml on HtmlComponent {
  String toHtml() => _componentsToHtml([this]);
}

extension HtmlComponentsToHtml on List<HtmlComponent> {
  String toHtml() => _componentsToHtml(this);
}

String _componentsToHtml(List<HtmlComponent> content) {
  final sb = StringBuffer();

  for (final e in content) {
    switch (e) {
      case TagComponent():
        _tagToHtml(e, sb);
      default:
        throw Exception("Cannot render Component of type ${e.runtimeType} directly on a HTML document");
    }
  }

  return sb.toString();
}

void _tagToHtml(TagComponent tag, StringBuffer sb) {
  ///Automatically adds DOCTYPE when converting a `html` tag into `String`
  if (tag.name == "html") {
    sb.write("<!DOCTYPE html>");
  }

  sb.write("<${tag.name}");

  for (int i = 0; i < tag.attributes.length; i++) {
    final e = tag.attributes[i];
    switch (e) {
      case AttributeComponent():
        _attributeToHtml(e, sb);
      default:
        throw Exception("Not valid attribute, ${e.runtimeType}");
    }
  }

  if (!tag.isVoid) {
    sb.write(">");

    for (int i = 0; i < tag.content.length; i++) {
      final e = tag.content[i];
      switch (e) {
        case TagComponent():
          _tagToHtml(e, sb);
        case Text():
          sb.write(HtmlComponent.escapeString(e.text));
        case Raw():
          sb.write(e.content);
      }
    }

    sb.write("</${tag.name}>");
  } else {
    sb.write("/>");
  }
}

void _attributeToHtml(AttributeComponent a, StringBuffer sb) {
  final name = a.name;
  if (a.content == null) {
    sb.write(" $name");
  } else {
    final content = switch (a) {
      EscapedAttributeComponent(:final content) => HtmlComponent.escapeString(content!),
      RawAttributeComponent(:final content) => content!,
    };

    sb.write(' $name="$content"');
  }
}
