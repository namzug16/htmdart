import 'package:htmdart/htmdart.dart';
import 'package:htmdart_site/src/docs/docs_htmleez/docs_htmleez_components.dart';
import 'package:htmdart_site/src/docs/docs_htmleez/docs_htmleez_intro.dart';
import 'package:htmdart_site/src/docs/docs_intro.dart';
import 'package:htmdart_site/src/docs/docs_quickstart.dart';
import 'package:htmdart_site/src/handlers/page_docs_handler.dart';
import 'package:htmdart_site/src/handlers/page_home_handler.dart';
import 'package:htmdart_site/src/handlers/page_translator_handler.dart';
import 'package:shelf_router/shelf_router.dart';

final router = () {
  final r = Router()
    //NOTE: pages
    ..getHtml("/", pageHomeHandler)
    ..getHtml("/translator", pageTranslatorHandler)
    //NOTE: fragments
    ..getHtml("/translate", fragmentTranslateHandler);

  //NOTE: Docs
  for (int i = 0; i < _docs.length; i++) {
    final d = _docs[i];
    (String, String)? prev;
    (String, String)? next;

    if (i - 1 >= 0) {
      prev = (_docs[i - 1].$1, _docs[i - 1].$2);
    }

    if (i + i <= _docs.length) {
      next = (_docs[i + 1].$1, _docs[i + 1].$2);
    }

    r.get(d.$1, pageDocsHandler(d.$3, prev, next));
  }

  return r;
}();

final _docs = [
  ("/docs", "Introduction", docsIntro),
  ("/docs/quick_start", "Quick Start", docsQuickstart),
  ("/docs/htmleez", "Htmleez Intro", docsHtmleezIntro),
  ("/docs/htmleez/components", "Htmleez Components", docsHtmleezComponents),
  ("/docs/htmleez/tags", "Htmleez Tags", docsHtmleezIntro),
  ("/docs/htmleez/attributes", "Htmleez Attributes", docsHtmleezIntro),
  ("/docs/htmleez/events_and_commands", "Htmleez Intro", docsHtmleezIntro),
  ("/docs/htmleez/text", "Htmleez Intro", docsHtmleezIntro),
  ("/docs/htmleez/unsafe_raw", "Htmleez Intro", docsHtmleezIntro),
];
