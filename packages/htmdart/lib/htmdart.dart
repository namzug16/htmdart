/// Htmdart
library;

import "dart:io";

import "package:htmdart/src/router/router.dart";
import "package:shelf/shelf_io.dart" as io;
import "package:shelf_hotreload/shelf_hotreload.dart" as shr;

export "package:htmleez/htmleez.dart";
export "package:shelf/shelf.dart" show Handler, Middleware, Request, Response, Server, createMiddleware;

export "src/hx.dart";
export "src/hx_request_extensions.dart";
export "src/hyperscript.dart";
export "src/response.dart";
export "src/router/router.dart" show Router;

const _banner = r"""
    __  __________  _______  ___    ____  ______
   / / / /_  __/  |/  / __ \/   |  / __ \/_  __/
  / /_/ / / / / /|_/ / / / / /| | / /_/ / / /   
 / __  / / / / /  / / /_/ / ___ |/ _, _/ / /    
/_/ /_/ /_/ /_/  /_/_____/_/  |_/_/ |_| /_/     
""";

/// Starts an HTTP server that serves requests using the given [Router].
///
// ignore: comment_references
/// Wraps [shelf_io.serve] with additional options tailored
/// for **htmdart** projects, including hot-reload support and a custom
/// `X-Powered-By` header.
void serve(
  Router router,
  Object address,
  int port, {
  required bool withHotreload,
  SecurityContext? securityContext,
  int? backlog,
  bool shared = false,
  String? poweredByHeader = "Dart with package:htmdart",
}) {
  Future<HttpServer> createHttpServer() => io.serve(
    router.call,
    address,
    port,
    securityContext: securityContext,
    backlog: backlog,
    shared: shared,
    poweredByHeader: poweredByHeader,
  );

  if (withHotreload) {
    shr.withHotreload(createHttpServer);
  } else {
    createHttpServer();
  }

  //
  // ignore: avoid_print
  print(_banner);
  //
  // ignore: avoid_print
  print("=> htmdart server started on :$port");
}
