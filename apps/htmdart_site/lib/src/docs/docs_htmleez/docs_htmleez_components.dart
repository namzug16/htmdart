import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/components/info_alert.dart';
import 'package:htmdart_site/src/utils/extensions.dart';

final docsHtmleezComponents = [
  "Components".h2,
  "Htmleez has two main building blocks, Tags and Attributes".p,
  "A Tag can be defined like this".p,
  '''
final div = Tag("div");

final component = div([
  div([]),
  div([]),
  div([]),
]);

/// This component will literally render to
/// <div>
///   <div></div>
///   <div></div>
///   <div></div>
/// </div>

'''
      .dartCode,
  p([
    "Thanks to the simple creation and use of a Tag, Htmleez gives you out of the box all the listed tags inside "
        .span,
    ("the w3 school html reference", "https://www.w3schools.com/tags/").a,
    ". Attributes are basically the same".span,
  ]),
  '''
final src = Attribute("src");

final attr = src("https://htmdart.dev");

/// This will render to
/// "src"="https://htmdart.dev"

'''
      .dartCode,
  "With these two components you can basically construct any type of html you can think off".p,
  infoAlert(p([
    "You can check out the ".span,
    ("translator", "/translator").a,
    " in order to see how html can be expressed in htmleez functions".span,
  ])),
  "How are they rendered?".h2,
  "Components are basically rendered as a normal string, this string can then be used however you like, you can send it as a response or you can save it to a file and server it as a static page. In order to render a component you need to first create an Html Renderer"
      .p,
  '''
final renderer = DefaultHtmlRenderer();

/// And then render your component
renderer.render(myComponent);
'''
      .dartCode,
  infoAlert("If you are using Htmdart you do not need to render your components manually, HtmlResponse.ok() will do it for you".p),
];
