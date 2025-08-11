// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:htmleez/htmleez.dart';
import 'package:htmleez_static/htmleez_static.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

Future<void> main() async {
  final site = StaticSite("localhost", "public")
    ..notFoundPage(page404())
    ..page("/", pageHome())
    ..page("/info", pageInfo())
    ..page("/contact", pageContact());

  site();

  final dir = 'public';

  final staticHandler = createStaticHandler(
    dir,
    defaultDocument: 'index.html',
    listDirectories: false,
  );

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler((Request req) async {
    final res = await staticHandler(req);

    // If not found, try serving custom 404.html (if it exists)
    if (res.statusCode == 404) {
      final notFound = File('$dir/404.html');
      if (notFound.existsSync()) {
        return Response(
          404,
          body: notFound.openRead(),
          headers: {'content-type': 'text/html; charset=utf-8'},
        );
      }
    }
    return res;
  });

  final server = await io.serve(handler, InternetAddress.loopbackIPv4, 8080);
  print('Serving $dir at http://${server.address.host}:${server.port}');
}

HTML basePage(List<HTML> bodyChildren) => html([
  head([
    meta([$charset("UTF-8")]),
    title(["My Simple Static Site".t]),
  ]),
  body(bodyChildren),
]);

HTML navLinks() => nav([
  a([
    $href("/"),
    "Home".t,
  ]),
  " | ".t,
  a([
    $href("/info"),
    "Info".t,
  ]),
  " | ".t,
  a([
    $href("/contact"),
    "Contact".t,
  ]),
]);

HTML pageHome() => basePage([
  navLinks(),
  "Welcome to My Site".h1(),
  "This is the homepage.".p(),
]);

HTML pageInfo() => basePage([
  navLinks(),
  "Info Page".h1(),
  "Here is some information about this site.".p(),
]);

HTML pageContact() => basePage([
  navLinks(),
  "Contact Page".h1(),
  "You can reach us at contact@example.com.".p(),
]);

HTML page404() => basePage([
  navLinks(),
  "404 - Page Not Found".h1(),
  "Oops! The page you are looking for does not exist.".p(),
]);
