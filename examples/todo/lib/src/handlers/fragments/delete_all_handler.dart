import 'package:netto/netto.dart';
import 'package:todo/src/components/error_component.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<void> deleteAllHandler(Ctx ctx) async {
  final repo = TaskRepo(ctx.ipAddress);

  final res = await repo.clearAll();

  return ctx.response.htmleez(switch (res) {
    Ok() => [
        tasksContainer([]),
        pendingTasksCount(0),
        errorComponent(null),
      ],
    Err(:final err) => [
        errorComponent("Something went wrong. $err"),
      ],
  });
}
