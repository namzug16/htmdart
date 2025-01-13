import 'package:htmdart/htmdart.dart';

HTML htmleezLogo(String textSize) => span([
  classes([
    textSize,
    "font-bold text-center",
  ]),
  "html".t,
  span([className("text-[#00FF00]"), "eez".t]),
]);
