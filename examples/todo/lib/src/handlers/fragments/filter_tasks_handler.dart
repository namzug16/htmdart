import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/task_filter.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<Response> filterTasksHandler(Request request) async {
  final i = int.parse(request.requestedUri.queryParameters["index"]!);
  final filter = TaskFilter.values[i];

  final repo = TaskRepo(request.ipAddress);

  final res = await repo.getAll(filter);

  return switch (res) {
    Ok(:final ok) => respondWithHtmlOob([
        tasksContainer(ok),
        taskFilter.$2(filter),
      ]),
    Err(:final err) => respondWithHtml([
        h1(["Something went wrong. $err".t])
      ]),
  };
}
