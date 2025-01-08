import 'package:shelf/shelf.dart';

import '../htmdart.dart';

extension HxRequestExtensions on Request {
  bool get isHx => this.headers[HX.request] == "true" ? true : false;

  String? get hxTarget => this.headers[HX.target];

  String? get hxTrigger => this.headers[HX.trigger];

  String? get hxTriggerName => this.headers[HX.triggerName];
}
