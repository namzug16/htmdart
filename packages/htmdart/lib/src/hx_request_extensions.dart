import "package:htmdart/htmdart.dart";

extension HxRequestExtensions on Request {
  bool get isHx => headers[HX.request] == "true";

  String? get hxBoosted => headers[HX.boosted];

  String? get hxCurrentURL => headers[HX.currentURL];

  String? get hxHistoryRestoreRequest => headers[HX.historyRestoreRequest];

  String? get hxPrompt => headers[HX.prompt];

  String? get hxTarget => headers[HX.target];

  String? get hxTriggerName => headers[HX.triggerName];

  String? get hxTrigger => headers[HX.trigger];
}
