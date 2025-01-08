import 'package:dart_mappable/dart_mappable.dart';

part 'task.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class Task with TaskMappable {
  final String id;
  final String content;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.content,
    required this.isCompleted,
  });
}
