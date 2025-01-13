import 'package:htmdart/htmdart.dart';

HTML htmdartLogo(String textSize) => span([
  classes([
    textSize,
    "font-bold text-center",
  ]),
  "htm".t,
  span([className("text-[#2B5B97]"), "dart".t]),
]);
