import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<Response> completeAllHandler(Request request) async {
  final body = Uri.splitQueryString(await request.readAsString());
  final filter = int.parse(body["filter"]!);

  final repo = TaskRepo(request.ipAddress);

  final res = await repo.setAllAsCompleted();

  if (!res.isOk) {
    return respondWithHtml(["Something went wrong".t]);
  }

  final tasks = await repo.getAll(TaskFilter.all);

  return switch (tasks) {
    Ok(:final ok) => respondWithHtmlOob([
        if (filter != 1) tasksContainer(ok),
        if (filter == 1) tasksContainer([]),
        pendingTasksCount(0),
      ]),
    Err(:final err) => respondWithHtml([
        h1(["Something went wrong. $err".t]),
      ]),
  };
}
