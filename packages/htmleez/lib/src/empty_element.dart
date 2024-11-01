import 'element.dart';

final class EmptyElement extends Element {
  EmptyElement();

  EmptyElement._([this._content]);

  List<Element>? _content;

  Element call(List<Element> content) {
    final res = <Element>[];
    for (var i = 0; i < content.length; i++) {
      var element = content[i];
      if (element is ElementSet) {
        for (var j = 0; j < element.elements.length; j++) {
          res.add(element.elements[j]);
        }
      } else {
        res.add(element);
      }
    }
    return EmptyElement._(res);
  }

  @override
  void render(StringBuffer sb) {
    for (int i = 0; i < _content!.length; i++) {
      _content![i].render(sb);
    }
  }
}

final empty = EmptyElement();
