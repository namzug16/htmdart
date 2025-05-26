import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/task_filter.dart';
import 'package:todo/src/handlers/fragments/toggle_completed_task_handler.dart';
import 'package:todo/src/models/task.dart';

HTML taskComponent(Task t) => div([
      $class("flex gap-4 items-center"),
      $id("id_${t.id}"),
      input([
        $type("checkbox"),
        $hx.trigger("change"),
        $hx.vals("js:{filter: document.getElementById('${taskFilter.$1}').value}"),
        $hx.handle(toggleCompletedTaskHandler, null, {
          "id": t.id,
          "value": (!t.isCompleted).toString(),
        }),
        if (t.isCompleted) $checked(),
        $class("checkbox checkbox-ms"),
      ]),
      h1([
        if (t.isCompleted) $class("line-through"),
        t.content.t,
      ]),
    ]);
