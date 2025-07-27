import "dart:io";

import "package:routeez/routeez.dart";
import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart" as io;

final _logger = createMiddleware(
  requestHandler: (req) {
    print("${req.method} - ${req.url}");
    return null;
  },
);

final router = Router()
  ..use(_logger)
  ..get("/hello", (Request req) => Response.ok("Hello world"))
  ..get("/echo/:id", (Request req, String id) => Response.ok(id));

Future<void> main() async {
  print(router.rTree.getTreeString());

  final server = await io.serve(router.call, InternetAddress.loopbackIPv4, 8080);

  //
  // ignore: avoid_print
  print("Serving at http://${server.address.host}:${server.port}");
}
