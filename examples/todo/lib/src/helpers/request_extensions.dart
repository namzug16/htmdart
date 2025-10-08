import 'package:htmdart/htmdart.dart' hide html;
import 'package:netto/netto.dart';


extension CtxExtensions on Ctx {
  String get ipAddress {
    final forwardedFor = request.headers['X-Forwarded-For'];
    final connInfo = request.raw.connectionInfo;
    final res = forwardedFor?.firstOrNull ?? connInfo?.remoteAddress.address;

    if (res == null) {
      throw Exception("Could not determine client IP");
    }

    return res;
  }
}

extension CtxResponseExtension on CtxResponse {
  void htmleez(List<HTML> components) => html(components.map((e) => e.add($hx.swapOob.yes)).toList().toHtml());
}

