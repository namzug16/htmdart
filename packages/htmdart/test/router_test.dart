import "package:htmdart/src/router/path_registry.dart";
import "package:htmdart/src/router/router.dart";
import "package:shelf/shelf.dart";
import "package:test/test.dart";

void main() {
  group("Router basic routing", () {
    late Router router;

    setUp(() {
      router = Router();
    });

    test("GET routes invoke correct handler", () async {
      var called = false;
      router.get("/hello", (Request req) {
        called = true;
        return Response.ok("world");
      });

      final response = await router.call(Request("GET", Uri.parse("http://localhost/hello")));
      expect(response.statusCode, equals(200));
      final body = await response.readAsString();
      expect(body, equals("world"));
      expect(called, isTrue);
    });

    test("HEAD is auto-added for GET routes", () async {
      router.get("/foo", (Request req) => Response.ok("bar"));

      final getResponse = await router.call(Request("GET", Uri.parse("http://localhost/foo")));
      expect(getResponse.statusCode, equals(200));
      expect(await getResponse.readAsString(), equals("bar"));

      final headResponse = await router.call(Request("HEAD", Uri.parse("http://localhost/foo")));
      // HEAD should return no body
      expect(headResponse.statusCode, equals(200));
      expect(await headResponse.readAsString(), isEmpty);
    });

    test("Any routes match any verb", () async {
      router.any("/any", (Request req) => Response.ok(req.method));
      for (final verb in ["GET", "POST", "PUT", "DELETE", "PATCH"]) {
        final resp = await router.call(Request(verb, Uri.parse("http://localhost/any")));
        expect(resp.statusCode, equals(200));
        expect(await resp.readAsString(), equals(verb));
      }
    });

    test("Route parameters are passed to handler", () async {
      String? id;
      router.get("/user/<id>", (Request req, String userId) {
        id = userId;
        return Response.ok("id $userId");
      });
      final resp = await router.call(Request("GET", Uri.parse("http://localhost/user/123")));
      expect(resp.statusCode, equals(200));
      expect(await resp.readAsString(), equals("id 123"));
      expect(id, equals("123"));
    });

    test("Duplicate handler registration throws", () {
      Response handler(Request req) => Response.ok("dup");
      router.get("/dup", handler);
      expect(() => router.post("/dup", handler), throwsA(isA<Exception>()));
    });

    test("Trailing slash in request is normalized", () async {
      router.get("/home/user", (Request req) => Response.ok("ok"));
      final resp1 = await router.call(Request("GET", Uri.parse("http://localhost/home/user/")));
      final resp2 = await router.call(Request("GET", Uri.parse("http://localhost/home/user")));
      expect(resp1.statusCode, equals(200));
      expect(await resp1.readAsString(), equals("ok"));
      expect(resp2.statusCode, equals(200));
      expect(await resp2.readAsString(), equals("ok"));
    });

    test("Not found returns default handler", () async {
      final resp = await router.call(Request("GET", Uri.parse("http://localhost/not/exists")));
      expect(resp.statusCode, equals(404));
      expect(await resp.readAsString(), contains("Route not found"));
    });
  });

  group("PathRegistry behavior", () {
    test("Registering same handler twice throws", () {
      final registry = PathRegistry();
      Response handler(Request req) => Response.ok("x");
      registry.registerPath("/a", "GET", handler);
      expect(() => registry.registerPath("/b", "POST", handler), throwsA(isA<Exception>()));
    });

    test("getMethodAndPath returns correct info", () {
      final registry = PathRegistry();
      Response handler(Request req) => Response.ok("y");
      registry.registerPath("/b", "POST", handler);
      final info = registry.getMethodAndPath(handler);
      expect(info.$1, equals("POST"));
      expect(info.$2, equals("/b"));
    });
  });

  group("GroupRouter", () {
    late Router base;
    late GroupRouter group;
    setUp(() {
      base = Router();
      group = base.group("/api");
    });

    test("Group prefix applies to routes", () async {
      group.get("/test", (Request req) => Response.ok("grp"));
      final resp = await base.call(Request("GET", Uri.parse("http://localhost/api/test")));
      expect(resp.statusCode, equals(200));
      expect(await resp.readAsString(), equals("grp"));
    });
  });
}
