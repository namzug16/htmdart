import 'package:netto/netto.dart';
import 'package:todo/src/components/error_component.dart';
import 'package:todo/src/components/task_filter.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';

Future<void> filterTasksHandler(Ctx ctx) async {
  final i = int.parse(ctx.request.queryParameters["index"]!.first);

  final filter = TaskFilter.values[i];

  final repo = TaskRepo(ctx.ipAddress);

  final res = await repo.getAll(filter);

  return ctx.response.htmleez(switch (res) {
    Ok(:final ok) => [
        tasksContainer(ok),
        taskFilter.$2(filter),
        errorComponent(null),
      ],
    Err(:final err) => [
        errorComponent("Something went wrong. $err"),
      ],
  });
}
