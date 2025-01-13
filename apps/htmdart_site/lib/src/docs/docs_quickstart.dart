import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/utils/extensions.dart';

final docsQuickstart = [
  "🚧🚧🚧 Work in progress 🚧🚧🚧".h1,
//   "Before Starting".h2,
//   ul([
//     li(["Make sure you are using a Dart version >= 3.0".t]),
//     li([
//       "Be familiar with the main Htmx concepts like swapping and targetting".t
//     ]),
//   ]),
//   "Install".h2,
//   "You can install htmdart either from the terminal".p,
//   "dart pub add htmdart".bashCode,
//   "or by adding it in your pubspec.yaml".p,
//   '''
// ...
// dependencies:
//   htmdart: any // or the version you prefer
// ...
//   '''
//       .code("language-yaml"),
//   p([
//     "Htmdart works alongside ".span,
//     ("Shelf", "https://pub.dev/packages/shelf").a,
//     "so make sure to also install shelf, shelf_router and if you need to shelf_static".span,
//   ]),
//   "dart pub add shelf \\ \ndart pub add shelf_router \\ \ndart pub add shelf_static".bashCode,
//   "Writing your first web application with dart and htmx".h2,
//   "Htmdart has a minimalistic aproach compared to other libraries built on top of shelf, instead of reinventing the wheel, it adds specific functionality to the shelf handlers and router".p,
//   "So let's start by creating a handler that would return an ok response with a body containing html".p,
// '''
// Response helloWorldHandler(Request request) {
//   return HtmlResponse.ok(
//     html([
//       "Hello world!".h1,
//     ]),
//   );
// }
// '''.dartCode,
//   "As you can see, htmdart handlers are basically shelf handlers that simply might return html".p,
//   "The difference lies on how we add this handler into our router. A normal approach would be to do something like this".p,
// '''
// final router = Router()..get("/", helloWorldHandler);
// '''.dartCode,
//   "However htmdart ".p,
];

final _c1 = '''
Response pageHomeHandler(Request request) {
  return HtmlResponse.ok(
    basePage(
      h1([
        id("greeting"),
        "Hello World!".t,
      ]),
      button([
        "Say Hi to htmdart".t,
        fragmentHomeHandler.hxResolve(), // Automatically adds hx-post
      ]),
    ),
  );
}

Response fragmentHomeHandler(Request request) {
  return HtmlResponse.ok(
    hx.oobSwap(
      h1([
        id("greeting"),
        "Hello Htmdart!".t,
      ]),
    ),
  );
}
''';
