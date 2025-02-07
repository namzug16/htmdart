import 'package:htmdart/htmdart.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:todo/src/handlers/fragments/complete_all_handler.dart';
import 'package:todo/src/handlers/fragments/create_task_handler.dart';
import 'package:todo/src/handlers/fragments/delete_all_handler.dart';
import 'package:todo/src/handlers/fragments/filter_tasks_handler.dart';
import 'package:todo/src/handlers/fragments/toggle_completed_task_handler.dart';
import 'package:todo/src/handlers/pages/home_page_handler.dart';

final router = Router()
  ..getHtml("/", homePageHandler)
  ..getHtml("/filter", filterTasksHandler)
  ..postHtml("/add", createTaskHandler)
  ..postHtml("/toggle_completed", toggleCompletedTaskHandler)
  ..postHtml("/complete_all", completeAllHandler)
  ..deleteHtml("/", deleteAllHandler);
