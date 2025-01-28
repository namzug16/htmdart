import 'package:htmleez/src/markup_component.dart';

import 'attributes.dart' as attr;

final class IdentifiableComponent<T> {
  final String id;
  final MarkupComponent Function(T params) _component;
  const IdentifiableComponent(this.id, MarkupComponent Function(T params) component) : _component = component;

  MarkupComponent call(T params) => _component(params).appendChild(attr.id(id)); 
}

IdentifiableComponent<T> identifiableComponent<T>(String id, MarkupComponent Function(T params) component) => IdentifiableComponent(id, component);
