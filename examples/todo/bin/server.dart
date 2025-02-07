import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:todo/router.dart';
import 'package:todo/src/middlewares/pretty_console_log_middleware.dart';
import 'package:todo/db.dart';

void main(List<String> args) async {
  initDb();

  final ip = InternetAddress.anyIPv4;

  final staticHandler = createStaticHandler('public');

  final handler = Pipeline()
      .addMiddleware(prettyConsoleLogMiddleware())
      .addHandler(router.call);

  final cascade = Cascade().add(handler).add(staticHandler);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(cascade.handler, ip, port);
  print('Server listening on port ${server.port}');

  // ProcessSignal.sigint.watch().listen((signal) async {
  //   print('Received SIGINT. Shutting down...');
  //   db.dispose();
  // });
  //
  // ProcessSignal.sigterm.watch().listen((signal) async {
  //   print('Received SIGTERM. Shutting down...');
  //   db.dispose();
  // });
}
