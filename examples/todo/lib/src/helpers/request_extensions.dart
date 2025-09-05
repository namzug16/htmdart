import 'dart:io';

import 'package:htmdart/htmdart.dart';

extension RequestExtensions on Request {
  String get ipAddress {
    final forwardedFor = headers['X-Forwarded-For'];
    final res = forwardedFor ?? (context['shelf.io.connection_info'] as HttpConnectionInfo?)?.remoteAddress.address;

    if (res == null) {
      throw Exception("Could not determine client IP");
    }

    return res;
  }
}
