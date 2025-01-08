import 'package:htmdart/htmdart.dart';
import 'package:todo/src/handlers/fragments/toggle_completed_task_handler.dart';
import 'package:todo/src/models/task.dart';

HTML taskComponent(Task t) => div([
      className("flex gap-4"),
      id("id_${t.id}"),
      input([
        type("checkbox"),
        hx.trigger("change"),
        toggleCompletedTaskHandler.hxResolve(
          queryParameters: {
            "id": t.id,
            "value": !t.isCompleted,
          },
        ),
        if (t.isCompleted) checked,
        className("checkbox checkbox-ms"),
      ]),
      h1([
        classes([
          if (t.isCompleted) "line-through",
        ]),
        t.content.t,
      ]),
    ]);
