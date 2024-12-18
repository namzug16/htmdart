import 'package:htmleez/htmleez.dart';
import 'package:htmleez/src/html_renderer.dart';

void main() {
  final component = html([
    body([
      id("main_body"),
      div([
        onload([
          consoleLog("La ctm"),
          consoleLog("La ctm 2"),
          toggleClassOnElement("body", "hidden"),
        ]),
      ]),
    ]),
  ]);

  final renderer = DefaultHtmlRenderer();

  final s = renderer.render(component);

  print(s);
}
