import "dart:io";

import "package:htmdart/htmdart.dart";
import "package:http/http.dart" as http;
import "package:shelf/shelf_io.dart" as io;
import "package:test/test.dart";

Router _createRouter() {
  final router = Router()
    ..get("/hello", (Request req) => Response.ok("Hello"))
    ..get("/user/:id", (Request req, String id) => Response.ok("User $id"))
    ..get("/with-middleware", (Request req) => Response.ok("ok"));

  final _ = router.group("/api", (innerHandler) {
    return (request) async {
      final res = await innerHandler(request);
      return res.change(headers: {"x-group": "1"});
    };
  })..get("/ping", (Request req) => Response.ok("pong"));

  final _ = router.group("/g1", (innerHandler) {
    return (request) async {
      final res = await innerHandler(request);
      return res.change(headers: {"x-group": "g1"});
    };
  })..get("/a", (Request req) => Response.ok("a"));

  final g2 =
      router.group("/g2", (innerHandler) {
          return (request) async {
            final res = await innerHandler(request);
            return res.change(headers: {"x-group": "g2"});
          };
        })
        ..get("/b", (Request req) => Response.ok("b"))
        //NOTE: test a middleware that has been added later one
        ..use((innerHandler) {
          return (req) async {
            final res = await innerHandler(req);
            return res.change(headers: {"x-extra": ""});
          };
        });

  //NOTE: anonymous group
  final _ = router.group(null, (innerHandler) {
    return (request) async {
      final res = await innerHandler(request);
      return res.change(headers: {"x-group": "anon"});
    };
  })..get("/anon", (Request req) => Response.ok(""));

  //NOTE: nested group
  final _ = g2.group("/n", (innerHandler) {
    return (request) async {
      final res = await innerHandler(request);
      return res.change(headers: {"x-nested": "g2/n"});
    };
  })..get("/c", (Request req) => Response.ok("c"));

  //NOTE: tests also the correctness of middleware chaining in groups
  router.use((innerHandler) {
    return (request) async {
      final res = await innerHandler(request);
      return res.change(headers: {"x-powered-by": "test"});
    };
  });

  return router;
}

void main() {
  late io.IOServer server;

  setUp(() async {
    server = await io.IOServer.bind(InternetAddress.loopbackIPv4, 0)
      ..mount(_createRouter().call);
  });

  tearDown(() => server.close());

  Uri url(String path) => Uri.parse("${server.url}$path");

  Future<String> read(String path) => http.read(url(path));
  Future<int> head(String path) async => (await http.head(url(path))).statusCode;
  Future<http.Response> get(String path) => http.get(url(path));
  // Future<http.Response> put(String path) => http.put(url(path));
  // Future<http.Response> post(String path) => http.post(url(path));

  test("should return correct handler", () async {
    expect(await head("/hello"), 200);
    expect(await read("/hello"), "Hello");
  });

  test("should return not found handler", () async {
    final res = await get("/notfound");
    expect(res.statusCode, 404);
    expect(res.body, "Route not found");
  });

  test("should pass params to handler correctly", () async {
    expect(await read("/user/42"), "User 42");
  });

  test("should apply middleware to matched route", () async {
    final res = await get("/with-middleware");
    expect(res.statusCode, 200);
    expect(res.headers["x-powered-by"], "test");
  });

  test("should apply group middleware to group routes", () async {
    final res = await get("/api/ping");
    expect(res.statusCode, 200);
    expect(res.headers["x-group"], "1");
  });

  test("should isolate middleware between groups", () async {
    final res1 = await get("/g1/a");
    final res2 = await get("/g2/b");

    expect(res1.statusCode, 200);
    expect(res2.statusCode, 200);

    expect(res1.headers["x-group"], "g1");
    expect(res2.headers["x-group"], "g2");
  });

  test("should add middleware globally to a group", () async {
    final res = await get("/g2/b");

    expect(res.statusCode, 200);

    expect(res.headers["x-group"], "g2");
    expect(res.headers["x-extra"], "");
  });

  test("should nest groups correctly", () async {
    final res = await get("/g2/n/c");

    expect(res.statusCode, 200);
    expect(res.headers["x-group"], "g2");
    expect(res.headers["x-extra"], "");
    expect(res.headers["x-nested"], "g2/n");
    expect(res.body, "c");
  });

  test("should create anonymous groups correctly", () async {
    final res = await get("/anon");

    expect(res.statusCode, 200);
    expect(res.headers["x-group"], "anon");
    expect(res.headers["x-powered-by"], "test");
    expect(res.body, "");
  });

  test("should all be powered by test", () async {
    Future<String?> getPoweredBy(String path) async {
      final res = await get(path);
      return res.headers["x-powered-by"];
    }

    const s = "test";

    expect(await getPoweredBy("/hello"), s);
    expect(await getPoweredBy("/user/a"), s);
    expect(await getPoweredBy("/api/ping"), s);
    expect(await getPoweredBy("/g1/a"), s);
    expect(await getPoweredBy("/g2/b"), s);
    expect(await getPoweredBy("/g2/n/c"), s);
  });
}
