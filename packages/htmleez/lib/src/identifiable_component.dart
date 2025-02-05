import 'package:htmleez/htmleez.dart';
import 'package:htmleez/src/markup_component.dart';

final class IdentifiableComponent<T> {
  final String id;
  final MarkupComponent Function(T params) _component;
  const IdentifiableComponent(this.id, MarkupComponent Function(T params) component) : _component = component;

  MarkupComponent call(T params) => _component(params).add(Attribute("id")(id)); 
}

class ID {
  MarkupComponent call(String value) => Attribute("id")(value);

  IdentifiableComponent<T> component<T>(String id, MarkupComponent Function(T params) component) => IdentifiableComponent<T>(id, component);
}

final id = ID();
