import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/components/htmleez_logo.dart';
import 'package:htmdart_site/src/utils/extensions.dart';

final docsHtmleezIntro = [
  div([
    className("flex place-content-center"),
    htmleezLogo("text-6xl"),
  ]),
  "Htmleez is the fastest way to dynamically compose html in dart".p,
  "But why in pure dart and not in html templates?".h2,
  p([
  "Html templeting engines are usually the standard for composing dynamic html, creating reusable components and adding logical structures to it. However Dart makes things easier thanks to its powerful ".span,
  ("control-flow operator", "").a,
  ". This means that we can compose html in dart just like we do it with widgets in flutter. For example".span,
  ]),
  '''
final doc = html([
  head([]),
  body([]),
]);
  '''.dartCode,
  "Do you want to conditionally render a text?".p,
  '''
final myComponent = div([
  if (condition)
    "True".t,
  else
    "False".t,
]);
  '''.dartCode,
  "Do you want to add items based on a for loop?".p,
  '''
final myComponent = div([
  for (int i = 0; i < 10; i+++)
    "Item $i".t,
]);
  '''.dartCode,
];
