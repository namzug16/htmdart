import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<Response> deleteAllHandler(Request request) async {
  final repo = TaskRepo(request.ipAddress);

  final res = await repo.clearAll();

  return switch (res) {
    Ok() => [
        tasksContainer([]).add($hx.swapOob.yes),
        pendingTasksCount(0).add($hx.swapOob.yes),
      ].response,
    Err(:final err) => [
        h1(["Something went wrong. $err".t]),
      ].response,
  };
}
