import 'package:htmdart/htmdart.dart';

HTML errorComponent(String? error) => div([
      $id("error-container"),
      if (error != null) ...[
        $class("alert alert-error"),
        error.t,
      ],
    ]);
