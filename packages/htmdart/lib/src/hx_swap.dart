import 'package:htmdart/htmdart.dart';
import 'package:htmleez/htmleez.dart';

class HxSwap {
  final String type;

  HxSwap() : type = "hx-swap";

  HxSwap.oob() : type = "hx-swap-oob";

  HTML call(String value) => _swap(type)(value);
  late final yes = _swap(type)(swapTrue);
  late final innerHTML = _swap(type)(swapInnerHtml);
  late final outerHTML = _swap(type)(swapOuterHtml);
  late final textContent = _swap(type)(swapTextContent);
  late final beforebegin = _swap(type)(swapBeforeBegin);
  late final afterbegin = _swap(type)(swapAfterBegin);
  late final beforeend = _swap(type)(swapBeforeEnd);
  late final afterend = _swap(type)(swapAfterEnd);
  late final delete = _swap(type)(swapDelete);
  late final none = _swap(type)(swapNone);
}

Attribute _swap(String type) => Attribute(type);
