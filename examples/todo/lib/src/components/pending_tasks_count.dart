import 'package:htmleez/htmleez.dart';

HTML pendingTasksCount(int count) => div([
      id("pending-tasks"),
      "$count Items Left".t,
    ]);
