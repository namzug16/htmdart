import 'package:shelf/shelf.dart';

import '../htmdart.dart';

extension HxRequestExtensions on Request {
  bool get isHx => headers[HX.request] == "true" ? true : false;

  String? get hxTarget => headers[HX.target];

  String? get hxTrigger => headers[HX.trigger];

  String? get hxTriggerName => headers[HX.triggerName];
}
