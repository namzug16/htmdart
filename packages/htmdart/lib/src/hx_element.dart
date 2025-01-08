import 'package:htmleez/htmleez.dart';

base class HxElement {
  final HTML root;

  const HxElement({
    required this.root,
  });
}

final class Fragment extends HxElement {
  Fragment({
    required super.root,
    this.headers = const {},
  });

  final Map<String, String> headers;
}

final class Page extends HxElement {
  Page({
    required super.root,
  });
}
