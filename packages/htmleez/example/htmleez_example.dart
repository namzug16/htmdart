import 'package:htmleez/htmleez.dart';

void main() {
  final component = html([
    body([
      id("main_body"),
      h1(["Hello HTMDART".t]),
    ]),
  ]);

  final renderer = DefaultHtmlRenderer();

  final s = renderer.render(component);

  print(s);
}
