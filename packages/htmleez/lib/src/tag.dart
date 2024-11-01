import 'attribute.dart';
import 'element.dart';
import 'event.dart';

final class Tag implements Element {
  Tag(this.name, this.isVoid);

  Tag._(
    this.name,
    this.isVoid,
    this._attributes,
    this._events,
    this._content,
  );

  final String name;
  final bool isVoid;
  List<Element>? _attributes;
  List<Element>? _events;
  List<Element>? _content;

  Element call(List<Element> content) {
    final attributes = <Attribute>[];
    final events = <Event>[];
    final components = <Element>[];

    void _(Element e) {
      switch (e) {
        case Attribute():
          attributes.add(e);
        case Event():
          events.add(e);
        default:
          components.add(e);
      }
    }

    //NOTE: no need to be recursive, ElementSet do not have as a child another ElementSet
    for (var i = 0; i < content.length; i++) {
      var element = content[i];
      if (element is ElementSet) {
        for (var j = 0; j < element.elements.length; j++) {
          _(element.elements[j]);
        }
      } else {
        _(element);
      }
    }

    return Tag._(name, isVoid, attributes, events, components);
  }

  void appendChild(Element e) {
    //Ensure initialised
    if (_attributes == null || _content == null || _events == null) {
      throw Exception(
        "Tag has not been initialised. You need to call the call method for $name",
      );
    }
    switch (e) {
      case Attribute():
        _attributes!.add(e);
      case Event():
        _events!.add(e);
      default:
        _content!.add(e);
    }
  }

  @override
  void render(StringBuffer sb) {
    if (_attributes == null || _content == null || _events == null) {
      throw Exception(
        "Tag has not been initialised. You need to call the call method for $name",
      );
    }
    sb.write("<$name");

    for (int i = 0; i < _attributes!.length; i++) {
      _attributes![i].render(sb);
    }

    for (int i = 0; i < _events!.length; i++) {
      _events![i].render(sb);
    }

    sb.write(">");

    if (!isVoid) {
      for (int i = 0; i < _content!.length; i++) {
        _content![i].render(sb);
      }

      sb.write("</$name>");
    }
  }
}
