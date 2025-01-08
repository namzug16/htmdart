import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/task_component.dart';
import 'package:todo/src/models/task.dart';
import 'package:todo/src/handlers/fragments/create_task_handler.dart';

HTML tasksContainer(List<Task> tasks) => div([
      id("task-container"),
      className("flex flex-col gap-4 w-96"),
      form([
        id("task-input"),
        hx.swap("none"),
        createTaskHandler.hxResolve(),
        input([
          className("input input-bordered input-primary w-96"),
          type("text"),
          required,
          maxLength("150"),
          autoComplete("off"),
          autoFocus,
          name("todo"),
          placeholder("What needs to be done?")
        ]),
      ]),
      for (final t in tasks) taskComponent(t),
    ]);
