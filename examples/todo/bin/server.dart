import 'dart:io';

import 'package:htmdart/htmdart.dart';
import 'package:todo/router.dart';
import 'package:todo/db.dart';

Future<void> main() async {
  initDb();

  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  serve(router, ip, port, withHotreload: true);
}
