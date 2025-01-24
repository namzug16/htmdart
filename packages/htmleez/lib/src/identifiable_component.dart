import 'package:htmleez/src/markup_component.dart';

import 'attributes.dart' as attr;

final class IdentifiableComponent {
  final String id;
  final MarkupComponent _component;
  IdentifiableComponent(this.id, MarkupComponent component)
      : _component = component.appendChild(attr.id(id));

  MarkupComponent call() => _component;
}

IdentifiableComponent identifiableComponent(
        String id, MarkupComponent component) =>
    IdentifiableComponent(id, component);
