import 'dart:io';

import 'package:shelf/shelf_io.dart';
import 'package:todo/router.dart';
import 'package:todo/db.dart';

Future<void> main() async {
  initDb();

  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(router.call, ip, port);

  print('Server listening on port ${server.port}');
}
