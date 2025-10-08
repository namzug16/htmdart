import 'dart:io';

import 'package:netto/netto.dart';
import 'package:todo/db.dart';

import 'package:todo/src/handlers/fragments/complete_all_handler.dart';
import 'package:todo/src/handlers/fragments/create_task_handler.dart';
import 'package:todo/src/handlers/fragments/delete_all_handler.dart';
import 'package:todo/src/handlers/fragments/filter_tasks_handler.dart';
import 'package:todo/src/handlers/fragments/toggle_completed_task_handler.dart';
import 'package:todo/src/handlers/pages/home_page_handler.dart';

Future<void> main() async {
  initDb();

  final app = Netto()
    ..use(logger())
    ..static("/", "public")
    ..get("/", homePageHandler)
    ..get("/filter", filterTasksHandler)
    ..post("/add", createTaskHandler)
    ..post("/toggle_completed", toggleCompletedTaskHandler)
    ..post("/complete_all", completeAllHandler)
    ..delete("/", deleteAllHandler);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // serve(router, ip, port, withHotreload: true);
  await app.serve(InternetAddress.anyIPv4, port);
}
