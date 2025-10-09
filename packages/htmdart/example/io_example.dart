import "dart:io";

import "package:htmdart/htmdart.dart";

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);

  stdout.writeln("Listening on http://localhost:8080");

  await for (final request in server) {
    switch (request.uri.path) {
      case "/":
        request.response
          ..headers.contentType = ContentType.html
          ..write(
            html([
              head([
                script([$src("https://unpkg.com/htmx.org@2.0.4")]),
              ]),
              body([
                h1(["Hello from htmdart + dart:io".t]),
                button([
                  $hx.get("/time"),
                  $hx.swap.none,
                  "What time is it?".t,
                ]),
                div([$id("time-container")]),
              ]),
            ]).toHtml(),
          );
        await request.response.close();
      case "/time":
        request.response
          ..headers.contentType = ContentType.html
          ..write(
            span([
              $id("time-container"),
              $hx.swapOob.yes,
              "Server time: ${DateTime.now()}".t,
            ]).toHtml(),
          );

        await request.response.close();
      default:
        request.response.statusCode = HttpStatus.notFound;

        await request.response.close();
    }
  }
}
