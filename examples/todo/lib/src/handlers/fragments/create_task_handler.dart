import 'package:htmdart/htmdart.dart';
import 'package:netto/netto.dart';
import 'package:todo/src/components/error_component.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<void> createTaskHandler(Ctx ctx) async {
  final content = (await ctx.request.body.formValue("todo"))!;
  final filter = TaskFilter.values[int.parse((await ctx.request.body.formValue("filter"))!)];
  final repo = TaskRepo(ctx.ipAddress);
  final res = await repo.create(content);
  final pendingCount = await repo.countPendingTasks();

  return ctx.response.htmleez(switch (res) {
    Ok(:final ok) => switch (pendingCount) {
        Ok(ok: final c) => [
            if (filter != TaskFilter.completed) tasksContainer(ok).add($hx.swapOob.afterbegin),
            pendingTasksCount(c).add($hx.swapOob.yes),
            errorComponent(null),
          ],
        Err(:final err) => [
            errorComponent("Something went wrong. $err"),
          ],
      },
    Err(:final err) => [
        errorComponent("Something went wrong. $err"),
      ],
  });
}
