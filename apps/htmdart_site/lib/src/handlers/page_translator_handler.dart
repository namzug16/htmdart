import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/components/base_page.dart';
import 'package:htmdart_site/src/components/navbar.dart';
import 'package:htmdart_site/src/utils/translate_html.dart';
import 'package:shelf/shelf.dart';

Response pageTranslatorHandler(Request request) {
  return HtmlResponse.ok(
    basePage(
      body([
        hx.ext("preload"),
        navbar,
        div([
          className("flex flex-col gap-6 items-center p-8"),
          h1(["Translate html to htmleez".t]),
          div([
            className("flex gap-6 w-full"),
            textarea([
              name("html"),
              className("textarea textarea-primary w-full h-[40rem]"),
              placeholder("HTML"),
              fragmentTranslateHandler.hxResolve(),
              hx.trigger("keyup delay:300ms"),
            ]),
            htmleezTextarea(""),
          ]),
        ]),
      ]),
    ),
  );
}

Response fragmentTranslateHandler(Request request) {
  final htmlInput = request.requestedUri.queryParameters["html"] ?? "";

  final htmleezValue = translateHtml(htmlInput);

  return HtmlResponse.ok(
    hx.oobSwap(
      htmleezTextarea(htmleezValue),
    ),
  );
}

HTML htmleezTextarea(String v) => div([
      id("htmleez"),
      className("w-full h-[40rem] relative"),
      button([
        className("absolute top-0 right-0 btn btn-primary btn-sm m-4"),
        onclick([
          ComplexCommand('''
                    const textToCopy = document.getElementById('htmleez-textarea').textContent;
                    navigator.clipboard.writeText(textToCopy).then(function() {
                      console.log('Text successfully copied!');
                    }).catch(function(err) {
                      console.error('Failed to copy text: ', err);
                    });
                    self.textContent = 'Content Copied';
                  '''),
        ]),
        "Copy".t,
      ]),
      textarea([
        id("htmleez-textarea"),
        className("textarea textarea-primary w-full h-full"),
        placeholder("HTMLEEZ"),
        readOnly,
        v.t,
      ]),
    ]);
