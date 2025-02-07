import 'package:sqlite3/sqlite3.dart';
import 'package:todo/src/models/task.dart';
import 'package:todo/src/models/task_filter.dart';
import 'package:todo/src/result.dart';
import 'package:todo/db.dart';

class TaskRepo {
  final String ownerIP;

  const TaskRepo(this.ownerIP);

  Future<Result<List<Task>, Object?>> getAll(TaskFilter filter) async {
    try {
      late final ResultSet data;
      if (filter == TaskFilter.all) {
        data = db.select("SELECT * FROM tasks WHERE owner_ip = ? ORDER BY created_at DESC;", [ownerIP]);
      } else {
        data = db.select("SELECT * FROM tasks WHERE owner_ip = ? AND is_completed = ? ORDER BY created_at DESC;", [ownerIP, filter.index - 1]);
      }
      final tasks = (data as List).map((json) => TaskMapper.fromMap(json)).toList();
      return Ok(tasks);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<List<Task>, Object?>> create(String content) async {
    try {
      final data = db.select("INSERT INTO tasks (owner_ip, content) VALUES (?, ?) RETURNING *;", [ownerIP, content]);
      final tasks = (data as List).map((json) => TaskMapper.fromMap(json)).toList();
      return Ok(tasks);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<Task, Object?>> setCompleted(String id, bool value) async {
    try {
      final data = db.select("UPDATE tasks SET is_completed = ? WHERE id = ? RETURNING *;", [value, id]);
      if (data.isEmpty) throw Exception("Taks did not update correctly");
      final todo = TaskMapper.fromMap(data[0]);
      return Ok(todo);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<List<Task>, Object?>> setAllAsCompleted() async {
    try {
      final data = db.select("UPDATE tasks SET is_completed = 1 WHERE owner_ip = ?;", [ownerIP]);
      final tasks = (data as List).map((json) => TaskMapper.fromMap(json)).toList();
      return Ok(tasks);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<(), Object?>> clearAll() async {
    try {
      db.select("DELETE FROM tasks WHERE owner_ip = ?;", [ownerIP]);
      return Ok(());
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<int, Object?>> countPendingTasks() async {
    try {
      final data = db.select("SELECT COUNT(*) AS count FROM tasks WHERE owner_ip = ? AND is_completed = 0;", [ownerIP]);
      return Ok(data.first["count"]);
    } catch (e) {
      return Err(e);
    }
  }
}
