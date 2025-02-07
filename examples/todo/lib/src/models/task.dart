import 'package:dart_mappable/dart_mappable.dart';

part 'task.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.snakeCase,
)
class Task with TaskMappable {
  final String id;
  final String content;
  @MappableField(key: "is_completed")
  final int isCompletedInt;

  const Task({
    required this.id,
    required this.content,
    required this.isCompletedInt,
  });


  bool get isCompleted => isCompletedInt == 1;
}
