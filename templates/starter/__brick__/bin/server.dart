import "package:shelf/shelf_io.dart" as io;
import 'package:{{name}}/router.dart';

Future<void> main() async {
  final server = await io.serve(router.call, "localhost", 8080);

  //
  // ignore: avoid_print
  print("Serving at http://${server.address.host}:${server.port}");
}
