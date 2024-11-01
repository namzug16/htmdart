import 'dart:async';

import 'package:htmdart/src/path_registry.dart';
import 'package:htmleez/htmleez.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'html_response.dart';
import 'hx_element.dart';
import 'request_context.dart';

typedef HxElementHandler = FutureOr<HxElement> Function(RequestContext ctx);

class HxRouter {
  static final HxRouter _instance = HxRouter._internal();
  HxRouter._internal();
  factory HxRouter() => _instance;

  final Map<HxElementHandler, String> _fragmentEntries = {};
  final Map<HxElementHandler, String> _pageEntries = {};

  void addFragment(String path, HxElementHandler handler) {
    _fragmentEntries[handler] = path;
  }

  void addPage(String path, HxElementHandler handler) {
    _pageEntries[handler] = path;
  }

  Future<Response> call(Request request) async {
    final r = Router();

    for (final e in _fragmentEntries.entries) {
      PathRegistry().registerPath(e.key, e.value);
      r.all(e.value, _wrapHandler(e.key));
    }

    for (final e in _pageEntries.entries) {
      //NOTE: Pages can only be accessed through a GET request
      PathRegistry().registerPath(e.key, e.value);
      r.get(e.value, _wrapHandler(e.key));
    }

    return r.call(request);
  }

  FutureOr<Response> Function(
    Request request,
  ) _wrapHandler(
    HxElementHandler handler,
  ) {
    return (Request request) async {
      final ctx = RequestContext.fromRequest(
        request,
      );

      final element = await handler(ctx);

      if (element is Fragment) {
        return HtmlResponse.ok(
          doc(element.root),
          headers: element.headers,
        );
      }

      return HtmlResponse.ok(element.root);
    };
  }
}
