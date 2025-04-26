import "package:htmleez/htmleez.dart";

class HxSwap {
  HxSwap() : type = "hx-swap";

  HxSwap.oob() : type = "hx-swap-oob";

  final String type;

  HTML call(String value) => _swap(type)(value);
  late final yes = _swap(type)("true");
  late final innerHTML = _swap(type)("innerHTML");
  late final outerHTML = _swap(type)("outerHTML");
  late final textContent = _swap(type)("textContent");
  late final beforebegin = _swap(type)("beforebegin");
  late final afterbegin = _swap(type)("afterbegin");
  late final beforeend = _swap(type)("beforeend");
  late final afterend = _swap(type)("afterend");
  late final delete = _swap(type)("delete");
  late final none = _swap(type)("none");
}

Attribute _swap(String type) => Attribute(type);
