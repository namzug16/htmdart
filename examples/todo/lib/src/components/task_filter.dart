import 'package:htmdart/htmdart.dart';
import 'package:htmleez/htmleez.dart';
import 'package:todo/src/handlers/fragments/filter_tasks_handler.dart';
import 'package:todo/src/models/task_filter.dart';

final taskFilter = id.component<(TaskFilter,)>(
  "task-filter",
  (params) => select([
    className("select select-bordered select-sm w-full"),
    name("index"),
    hx.handle(filterTasksHandler),
    hx.trigger("change"),
    option([
      if (params.$1 == TaskFilter.all) selected(),
      value("0"),
      "All".t,
    ]),
    option([
      if (params.$1 == TaskFilter.pending) selected(),
      value("1"),
      "Pending".t,
    ]),
    option([
      if (params.$1 == TaskFilter.completed) selected(),
      value("2"),
      "Completed".t,
    ]),
  ]),
);
