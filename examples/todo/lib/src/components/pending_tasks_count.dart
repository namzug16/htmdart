import 'package:htmdart/htmdart.dart';

HTML pendingTasksCount(int count) => div([
      $id("pending-tasks"),
      "$count Items Left".t,
    ]);
