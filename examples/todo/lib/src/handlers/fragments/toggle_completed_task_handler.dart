import 'package:htmdart/htmdart.dart';
import 'package:netto/netto.dart';
import 'package:todo/src/components/error_component.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/task_component.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<void> toggleCompletedTaskHandler(Ctx ctx) async {
  final id0 = ctx.request.queryParameters["id"]?.firstOrNull;
  final value = ctx.request.queryParameters["value"]?.firstOrNull;
  final filterS = await ctx.request.body.formValue("filter");
  final filter = int.parse(filterS ?? "0");

  final repo = TaskRepo(ctx.ipAddress);

  final res = await repo.setCompleted(id0!, bool.parse(value!));

  final pendingCount = await repo.countPendingTasks();

  return ctx.response.htmleez(switch (res) {
    Ok(:final ok) => switch (pendingCount) {
        Ok(ok: final c) => [
            if (filter == 0) taskComponent(ok).add($hx.swapOob.yes) else if (ok.isCompleted && filter != 2 || !ok.isCompleted && filter != 1) div([$id("id_${ok.id}"), $hx.swapOob.delete]),
            pendingTasksCount(c).add($hx.swapOob.yes),
            errorComponent(null),
          ],
        Err(:final err) => [errorComponent("Something went wrong. $err")],
      },
    Err(:final err) => [errorComponent("Something went wrong. $err")],
  });
}
