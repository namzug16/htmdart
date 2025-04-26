import "package:htmdart/htmdart.dart" hide headers;
import "package:shelf/shelf.dart";

extension HxRequestExtensions on Request {
  bool get isHx => headers[HX.request] == "true";

  String? get hxTarget => headers[HX.target];

  String? get hxTrigger => headers[HX.trigger];

  String? get hxTriggerName => headers[HX.triggerName];
}
