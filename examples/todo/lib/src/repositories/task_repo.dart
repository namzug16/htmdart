import 'package:supabase/supabase.dart';
import 'package:todo/src/models/task.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/result.dart';

class TaskRepo {
  final String ownerIP;
  final SupabaseClient sc;

  const TaskRepo(this.ownerIP, this.sc);

  Future<Result<List<Task>, Object?>> getAll(TaskFilter filter) async {
    try {
      var query = sc.from('tasks').select().eq('owner_ip', ownerIP);

      if (filter == TaskFilter.completed) {
        query = query.eq('is_completed', true);
      } else if (filter == TaskFilter.pending) {
        query = query.eq('is_completed', false);
      }

      final data = await query;

      final tasks =
          (data as List).map((json) => TaskMapper.fromMap(json)).toList();
      return Ok(tasks);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<List<Task>, Object?>> create(String content) async {
    try {
      await sc.from('tasks').insert({
        'content': content,
        'owner_ip': ownerIP,
      });

      final data = await sc.from('tasks').select().eq('owner_ip', ownerIP);

      final tasks =
          (data as List).map((json) => TaskMapper.fromMap(json)).toList();
      return Ok(tasks);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<Task, Object?>> setCompleted(String id, bool value) async {
    try {
      final data = await sc
          .from('tasks')
          .update({
            'is_completed': value,
          })
          .eq('id', id)
          .select()
          .single();

      final todo = TaskMapper.fromMap(data);
      return Ok(todo);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<List<Task>, Object?>> setAllAsCompleted() async {
    try {
      await sc
          .from('tasks')
          .update({
            'is_completed': true,
          })
          .eq('owner_ip', ownerIP)
          .eq("is_completed", false);

      final data = await sc.from('tasks').select().eq('owner_ip', ownerIP);

      final tasks =
          (data as List).map((json) => TaskMapper.fromMap(json)).toList();

      return Ok(tasks);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<(), Object?>> clearAll() async {
    try {
      await sc.from('tasks').delete().eq('owner_ip', ownerIP);
      return Ok(());
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<int, Object?>> countPendingTasks() async {
    try {
      final data = await sc
          .from('tasks')
          .select()
          .eq('owner_ip', ownerIP)
          .eq('is_completed', false)
          .count();

      final count = data.count;
      return Ok(count);
    } catch (e) {
      return Err(e);
    }
  }
}
