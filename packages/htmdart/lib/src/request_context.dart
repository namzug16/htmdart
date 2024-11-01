import 'package:htmdart/src/hx.dart';
import 'package:shelf/shelf.dart';

class RequestContext {
  final Request request;
  final bool isHxRequest;
  final String? hxTarget;
  final String? hxTriggerName;
  final String? hxTrigger;

  const RequestContext._({
    required this.request,
    required this.isHxRequest,
    required this.hxTarget,
    required this.hxTrigger,
    required this.hxTriggerName,
  });

  factory RequestContext.fromRequest(Request r) {
    return RequestContext._(
      request: r,
      isHxRequest: r.headers[HX.request] == "true" ? true : false,
      hxTarget: r.headers[HX.target],
      hxTrigger: r.headers[HX.trigger],
      hxTriggerName: r.headers[HX.triggerName],
    );
  }
}
