import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/task_component.dart';
import 'package:todo/src/models/task.dart';

HTML tasksContainer(List<Task> tasks) => div([
      $id("task-container"),
      $class("flex flex-col gap-4 w-96"),
      for (final t in tasks) taskComponent(t),
    ]);
