import 'package:htmleez/htmleez.dart';

void main() {
  final el = html([
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

  final sb = StringBuffer();

  el.render(sb);

  print(sb.toString());
}
