import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<Response> createTaskHandler(Request request) async {
  final body = Uri.splitQueryString(await request.readAsString());
  final content = body["todo"]!;
  final filter = TaskFilter.values[int.parse(body["filter"]!)];
  final repo = TaskRepo(request.ipAddress);
  final res = await repo.create(content);
  final pendingCount = await repo.countPendingTasks();

  return switch (res) {
    Ok(:final ok) => switch (pendingCount) {
        Ok(ok: final c) => [
            if (filter != TaskFilter.completed) tasksContainer(ok).add($hx.swapOob.afterbegin),
            pendingTasksCount(c).add($hx.swapOob.yes),
          ],
        Err(:final err) => [
            h1(["Something went wrong. $err".t])
          ],
      },
    Err(:final err) => [
        h1(["Something went wrong. $err".t])
      ],
  }
      .response;
}
