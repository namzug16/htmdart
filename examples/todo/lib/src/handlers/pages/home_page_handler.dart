import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:todo/src/components/base_page.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/task_filter.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/handlers/fragments/complete_all_handler.dart';
import 'package:todo/src/handlers/fragments/delete_all_handler.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';
import 'package:todo/supabase.dart';

Future<Response> homePageHandler(Request request) async {
  final repo = TaskRepo(request.ipAddress, supabase);

  var filter = TaskFilter.all;

  if (request.isHx) {
    final f = request.requestedUri.queryParameters["filter"]!;
    filter = TaskFilter.fromName(f);
  }

  final res = await repo.getAll(filter);

  return switch (res) {
    Ok(:final ok) => HtmlResponse.ok(
        request.isHx
            ? hx.oobSwapMany([
                tasksContainer(ok),
                taskFilter(filter),
                pendingTasksCount(ok.where((e) => !e.isCompleted).length),
              ])
            : basePage(
                body([
                  id("tasks-body"),
                  className("flex flex-col gap-4 items-center"),
                  header([
                    h1([className("text-8xl text-primary"), "todo".t]),
                  ]),
                  div([
                    id("task-card-input"),
                    className("flex flex-col gap-6"),
                    tasksContainer(ok),
                    div([
                      className("flex flex-col gap-4 w-96"),
                      taskFilter(filter),
                      div([
                        className("flex justify-around w-96"),
                        pendingTasksCount(
                            ok.where((e) => !e.isCompleted).length),
                        button([
                          completeAllHandler.hxResolve(),
                          hx.swap(swapNone),
                          className("btn btn-success btn-xs"),
                          "Complete All".t,
                        ]),
                        button([
                          deleteAllHandler.hxResolve(),
                          hx.swap(swapNone),
                          className("btn btn-error btn-xs"),
                          "Clear All".t,
                        ]),
                      ]),
                    ]),
                  ]),
                ]),
              ),
      ),
    Err(:final err) => HtmlResponse.ok(h1(["Something went wrong. $err".t])),
  };
}
