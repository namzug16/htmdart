import 'attributes.dart' as attrs;
import 'markup_component.dart';

extension MarkupComponentExtensions on MarkupComponent {
  MarkupComponent className(String cn) => add(attrs.className(cn));
}
