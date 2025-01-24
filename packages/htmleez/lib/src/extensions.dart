import 'attributes.dart' as attrs;
import 'markup_component.dart';
import 'tags.dart' as tags;
import 'text.dart';

extension MarkupComponentExtensions on MarkupComponent {
  MarkupComponent className(String cn) => appendChild(attrs.className(cn));
}

extension MarkupeezAExtension on (String, String) {
  MarkupComponent get a => tags.a([$1.t, attrs.href($2)]);
}
