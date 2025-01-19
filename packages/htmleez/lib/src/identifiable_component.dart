import 'html_component.dart';
import 'attributes.dart' as attr;

final class IdentifiableComponent {
  final String id;
  final HTML _component;
  IdentifiableComponent(this.id, HTML html)
      : _component = html.appendChild(attr.id(id));

  HTML call() => _component;
}

IdentifiableComponent identifiableComponent(String id, HTML component) =>
    IdentifiableComponent(id, component);
