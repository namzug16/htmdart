import 'package:htmdart/htmdart.dart';
import 'package:todo/src/models/task_filter.dart';

final taskFilter = (
  "task-filter",
  (TaskFilter tf) => select([
        $class("select select-bordered select-sm w-full"),
        $id("task-filter"),
        $name("index"),
        $hx.get("/filter"),
        $hx.trigger("change"),
        option([
          if (tf == TaskFilter.all) $selected(),
          $value("0"),
          "All".t,
        ]),
        option([
          if (tf == TaskFilter.pending) $selected(),
          $value("1"),
          "Pending".t,
        ]),
        option([
          if (tf == TaskFilter.completed) $selected(),
          $value("2"),
          "Completed".t,
        ]),
      ]),
);
