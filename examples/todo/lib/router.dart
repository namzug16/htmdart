import 'package:htmdart/htmdart.dart';
import 'package:todo/src/handlers/fragments/complete_all_handler.dart';
import 'package:todo/src/handlers/fragments/create_task_handler.dart';
import 'package:todo/src/handlers/fragments/delete_all_handler.dart';
import 'package:todo/src/handlers/fragments/filter_tasks_handler.dart';
import 'package:todo/src/handlers/fragments/toggle_completed_task_handler.dart';
import 'package:todo/src/handlers/pages/home_page_handler.dart';

final router = Router()
  ..static("/", "public")
  ..get("/", homePageHandler)
  ..get("/filter", filterTasksHandler)
  ..post("/add", createTaskHandler)
  ..post("/toggle_completed", toggleCompletedTaskHandler)
  ..post("/complete_all", completeAllHandler)
  ..delete("/", deleteAllHandler);
