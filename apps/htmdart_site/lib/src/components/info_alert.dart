
  import 'package:htmdart/htmdart.dart';

HTML infoAlert(HTML content) => div([
    Attribute("role")("alert"),
    className("alert"),
    svg([
      Attribute("fill")("none"),
      className("stroke-info h-6 w-6 shrink-0"),
      Attribute("viewBox")("0 0 24 24"),
      Attribute("xmlns")("http://www.w3.org/2000/svg"),
      Tag("path")([
        Attribute("stroke-linecap")("round"),
        Attribute("stroke-linejoin")("round"),
        Attribute("stroke-width")("2"),
        Attribute("d")("M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"),
      ]),
    ]),
    content,
  ]);
