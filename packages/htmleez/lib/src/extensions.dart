import 'html_component.dart';
import 'attributes.dart' as attrs;
import 'tags.dart' as tags;
import 'text.dart';

extension HtmlComponentExtensions on HtmlComponent {
  HtmlComponent className(String cn) => appendChild(attrs.className(cn));
}

extension HtmleezAExtension on (String, String) {
  HtmlComponent get a => tags.a([$1.t, attrs.href($2)]);
}
