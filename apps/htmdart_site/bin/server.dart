import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:htmdart_site/router.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  final staticHandler = createStaticHandler('public');

  //FIX: make the router a function where you pass the directory you've read from the static files
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final cascade = Cascade().add(handler).add(staticHandler);

  final port = int.parse(Platform.environment['PORT'] ?? '8081');
  final server = await serve(cascade.handler, ip, port);
  print('Server listening on port ${server.port}');
}
