import 'package:htmdart/htmdart.dart';
import 'package:htmleez/htmleez.dart';

class HxSwap {
  HTML call(String value) => _swap(value);
  final yes = _swap(swapTrue);
  final innerHTML = _swap(swapInnerHtml);
  final outerHTML = _swap(swapOuterHtml);
  final textContent = _swap(swapTextContent);
  final beforebegin = _swap(swapBeforeBegin);
  final afterbegin = _swap(swapAfterBegin);
  final beforeend = _swap(swapBeforeEnd);
  final afterend = _swap(swapAfterEnd);
  final delete = _swap(swapDelete);
  final none = _swap(swapNone);
}

final _swap = Attribute("hx-swap");
