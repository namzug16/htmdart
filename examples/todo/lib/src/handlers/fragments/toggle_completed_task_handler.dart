import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/task_component.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<Response> toggleCompletedTaskHandler(Request request) async {
  final id0 = request.requestedUri.queryParameters["id"];
  final value = request.requestedUri.queryParameters["value"];
  final fd = Uri.splitQueryString(await request.change().readAsString());
  final filter = int.parse(fd["filter"] ?? "0");

  final repo = TaskRepo(request.ipAddress);

  final res = await repo.setCompleted(id0!, bool.parse(value!));

  final pendingCount = await repo.countPendingTasks();

  return switch (res) {
    Ok(:final ok) => switch (pendingCount) {
        Ok(ok: final c) => [
            if (filter == 0) taskComponent(ok).add($hx.swapOob.yes) else if (ok.isCompleted && filter != 2 || !ok.isCompleted && filter != 1) div([$id("id_${ok.id}"), $hx.swapOob.delete]),
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
