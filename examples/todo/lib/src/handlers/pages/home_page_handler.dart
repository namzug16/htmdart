import 'package:htmdart/htmdart.dart';
import 'package:todo/src/components/base_page.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/task_filter.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/handlers/fragments/complete_all_handler.dart';
import 'package:todo/src/handlers/fragments/delete_all_handler.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/handlers/fragments/create_task_handler.dart';
import 'package:todo/src/result.dart';

Future<Response> homePageHandler(Request request) async {
  final repo = TaskRepo(request.ipAddress);

  final res = await repo.getAll(TaskFilter.all);

  return respondWithHtml([
    switch (res) {
      Ok(:final ok) => basePage(
          body([
            $id("tasks-body"),
            $class("flex flex-col gap-4 items-center"),
            header([
              h1([$class("text-8xl text-primary"), "todo".t]),
            ]),
            div([
              $id("task-card-input"),
              $class("flex flex-col gap-6"),
              form([
                $id("task-input"),
                $hx.swap("none"),
                $hx.vals("js:{filter: document.getElementById('${taskFilter.$1}').value}"),
                $hx.handle(createTaskHandler),
                $_("on ${$hx.events.afterRequest} reset() me"),
                input([$class("input input-bordered input-primary w-96"), $type("text"), $required(), $maxlength("150"), $autocomplete("off"), $autofocus(), $name("todo"), $placeholder("What needs to be done?")]),
              ]),
              tasksContainer(ok),
              div([
                $class("flex flex-col gap-4 w-96"),
                taskFilter.$2(TaskFilter.all),
                div([
                  $class("flex justify-around w-96"),
                  pendingTasksCount(ok.where((e) => !e.isCompleted).length),
                  button([
                    $hx.handle(completeAllHandler),
                    $hx.swap.none,
                    $hx.vals("js:{filter: document.getElementById('${taskFilter.$1}').value}"),
                    $class("btn btn-success btn-xs"),
                    "Complete All".t,
                  ]),
                  button([
                    $hx.handle(deleteAllHandler),
                    $hx.swap.none,
                    $class("btn btn-error btn-xs"),
                    "Clear All".t,
                  ]),
                ]),
              ]),
            ]),
          ]),
        ),
      Err(:final err) => "Something went wrong. $err".t,
    }
  ]);
}
