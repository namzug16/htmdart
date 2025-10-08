import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/task_filter.dart';
import 'package:todo/src/models/task.dart';

HTML taskComponent(Task t) => div([
      $class("flex gap-4 items-center"),
      $id("id_${t.id}"),
      input([
        $type("checkbox"),
        $hx.trigger("change"),
        $hx.vals("js:{filter: document.getElementById('${taskFilter.$1}').value}"),
        $hx.post(
          Uri(path: "/toggle_completed", queryParameters: {
            "id": t.id,
            "value": (!t.isCompleted).toString(),
          }).toString(),
        ),
        if (t.isCompleted) $checked(),
        $class("checkbox checkbox-ms"),
      ]),
      h1([
        if (t.isCompleted) $class("line-through"),
        t.content.t,
      ]),
    ]);
