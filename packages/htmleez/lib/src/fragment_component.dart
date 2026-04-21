import "package:htmleez/src/html_component.dart";

final class FragmentComponent extends HtmlComponent {
  const FragmentComponent(this.content);

  final List<HtmlComponent> content;
}
