import 'package:htmleez/htmleez.dart';

void main() {
  final el = html([
    body([
      div([
        ev.onload([
          cmd.consoleLog("La ctm"),
          cmd.consoleLog("La ctm 2"),
          cmd.toggleClassOnElement("body", "hidden"),
        ]),
      ]),
    ]),
  ]);

  final sb = StringBuffer();

  el.render(sb);

  print(sb.toString());
}
