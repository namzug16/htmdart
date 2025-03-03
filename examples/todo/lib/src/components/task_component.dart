import 'package:htmdart/htmdart.dart';
import 'package:htmleez/htmleez.dart';
import 'package:todo/src/components/task_filter.dart';
import 'package:todo/src/handlers/fragments/toggle_completed_task_handler.dart';
import 'package:todo/src/models/task.dart';

HTML taskComponent(Task t) => div([
      className("flex gap-4 items-center"),
      id("id_${t.id}"),
      input([
        type("checkbox"),
        hx.trigger("change"),
        hx.vals("js:{filter: document.getElementById('${taskFilter.id}').value}"),
        toggleCompletedTaskHandler.hxResolve(
          queryParameters: {
            "id": t.id,
            "value": !t.isCompleted,
          },
        ),
        if (t.isCompleted) checked(),
        className("checkbox checkbox-ms"),
      ]),
      h1([
        if (t.isCompleted) className("line-through"),
        t.content.t,
      ]),
    ]);
