import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/task_component.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';
import 'package:todo/supabase.dart';

Future<Response> toggleCompletedTaskHandler(Request request) async {
  final id = request.requestedUri.queryParameters["id"];
  final value = request.requestedUri.queryParameters["value"];

  final repo = TaskRepo(request.ipAddress, supabase);

  final res = await repo.setCompleted(id!, bool.parse(value!));

  final pendingCount = await repo.countPendingTasks();

  return switch (res) {
    Ok(:final ok) => switch (pendingCount) {
        Ok(ok: final c) => HtmlResponse.ok(
            hx.oobSwapMany([
              taskComponent(ok),
              pendingTasksCount(c),
            ]),
          ),
        Err(:final err) => HtmlResponse.ok(
            h1(["Something went wrong. $err".t]),
          ),
      },
    Err(:final err) => HtmlResponse.ok(
        h1(["Something went wrong. $err".t]),
      ),
  };
}
