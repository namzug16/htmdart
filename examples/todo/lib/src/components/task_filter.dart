import 'package:htmdart/htmdart.dart';
import 'package:todo/src/handlers/pages/home_page_handler.dart';
import 'package:todo/src/models/task_filter.dart';

HTML taskFilter(TaskFilter filter) => select([
      className("select select-bordered select-sm w-full"),
      id("task-filter"),
      name("filter"),
      hx.trigger("change"),
      homePageHandler.hxResolve(),
      option([
        if (filter == TaskFilter.all) selected,
        "All".t,
      ]),
      option([
        if (filter == TaskFilter.pending) selected,
        "Pending".t,
      ]),
      option([
        if (filter == TaskFilter.completed) selected,
        "Completed".t,
      ]),
    ]);
