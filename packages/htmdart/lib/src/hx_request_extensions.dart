import "package:htmdart/src/hx.dart";
import "package:netto/netto.dart";

extension HxRequestExtensions on Ctx {
  bool get isHx => request.headers[HX.request]?.firstOrNull == "true";

  String? get hxBoosted => request.headers[HX.boosted]?.firstOrNull;

  String? get hxCurrentURL => request.headers[HX.currentURL]?.firstOrNull;

  String? get hxHistoryRestoreRequest => request.headers[HX.historyRestoreRequest]?.firstOrNull;

  String? get hxPrompt => request.headers[HX.prompt]?.firstOrNull;

  String? get hxTarget => request.headers[HX.target]?.firstOrNull;

  String? get hxTriggerName => request.headers[HX.triggerName]?.firstOrNull;

  String? get hxTrigger => request.headers[HX.trigger]?.firstOrNull;
}
