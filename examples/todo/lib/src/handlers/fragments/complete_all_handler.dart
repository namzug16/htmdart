import 'package:netto/netto.dart';
import 'package:todo/src/components/error_component.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<void> completeAllHandler(Ctx ctx) async {
  final filter = int.parse((await ctx.request.body.formValue("filter"))!);

  final repo = TaskRepo(ctx.ipAddress);

  final res = await repo.setAllAsCompleted();

  if (!res.isOk) {
    return ctx.response.htmleez([errorComponent("Something went wrong")]);
  }

  final tasks = await repo.getAll(TaskFilter.all);

  return ctx.response.htmleez(switch (tasks) {
    Ok(:final ok) => [
        if (filter != 1) tasksContainer(ok),
        if (filter == 1) tasksContainer([]),
        pendingTasksCount(0),
        errorComponent(null),
      ],
    Err(:final err) => [
        errorComponent("Something went wrong. $err"),
      ],
  });
}
