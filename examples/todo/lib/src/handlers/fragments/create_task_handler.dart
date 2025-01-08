import 'package:htmdart/htmdart.dart';
import 'package:shelf/shelf.dart';
import 'package:todo/src/components/pending_tasks_count.dart';
import 'package:todo/src/components/tasks_container.dart';
import 'package:todo/src/helpers/request_extensions.dart';
import 'package:todo/src/repositories/task_repo.dart';
import 'package:todo/src/result.dart';
import 'package:todo/supabase.dart';

Future<Response> createTaskHandler(Request request) async {
  final body = Uri.splitQueryString(await request.readAsString());

  final content = body["todo"]!;

  final repo = TaskRepo(request.ipAddress, supabase);

  final res = await repo.create(content);

  return switch (res) {
    Ok(:final ok) => HtmlResponse.ok(
        hx.oobSwapMany([
          tasksContainer(ok),
          pendingTasksCount(ok.length),
        ]),
      ),
    Err(:final err) => HtmlResponse.ok(
        h1(["Something went wrong. $err".t]),
      ),
  };
}
