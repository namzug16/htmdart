import 'element.dart';

final class Doc implements Element {
  Doc();

  Doc._(this._html);

  Element? _html;

  Element call(Element html) {
    return Doc._(html);
  }

  @override
  void render(StringBuffer sb) {
    if (_html == null) {
      throw Exception(
        "HTML Document has not been initialised. You need to call the call method",
      );
    }
    sb.write(' <!DOCTYPE html>');
    _html!.render(sb);
  }
}

final doc = Doc();
