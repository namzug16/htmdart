import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<Response> deleteAllHandler(Request request) async {
  final repo = TaskRepo(request.ipAddress);

  final res = await repo.clearAll();

  return switch (res) {
    Ok() => respondWithHtmlOob([
        tasksContainer([]),
        pendingTasksCount(0),
      ]),
    Err(:final err) => respondWithHtml([
        h1(["Something went wrong. $err".t])
      ]),
  };
}
