import "package:htmdart/src/router/radix_tree.dart";
import "package:test/test.dart";

void main() {
  group("RadixTree", () {
    test("should match static route", () {
      final tree = RadixTree<String>()..insert("/about", "About Page");

      final result = tree.get("/about");
      expect(result, isNotNull);
      expect(result!.value, equals("About Page"));
      expect(result.params, isEmpty);
    });

    test("should match route with param", () {
      final tree = RadixTree<String>()..insert("/product/:id", "Product Handler");

      final result = tree.get("/product/123");
      expect(result, isNotNull);
      expect(result!.value, equals("Product Handler"));
      expect(result.params, equals({"id": "123"}));
    });

    test("should match nested route with param", () {
      final tree = RadixTree<String>()..insert("/user/:uid/settings", "User Settings");

      final result = tree.get("/user/42/settings");
      expect(result, isNotNull);
      expect(result!.value, equals("User Settings"));
      expect(result.params, equals({"uid": "42"}));
    });

    test("should not match unknown route", () {
      final tree = RadixTree<String>()..insert("/home", "Home");

      final result = tree.get("/missing");
      expect(result, isNull);
    });

    test("should throw on duplicate static route", () {
      final tree = RadixTree<String>()..insert("/about", "A");
      expect(() => tree.insert("/about", "B"), throwsException);
    });

    test("should throw on conflicting parameter names", () {
      final tree = RadixTree<String>()..insert("/product/:id", "handler1");
      expect(() => tree.insert("/product/:productId", "handler2"), throwsException);
    });

    test("should not throw on param and static segment - route resolution priority", () {
      final tree = RadixTree<String>()
        ..insert("/page/:id", "param route")
        ..insert("/page/details", "static route");
      final result = tree.get("/page/details");
      expect(result, isNotNull);
      expect(result!.value, equals("static route"));
    });

    test("should support multiple routes with shared static prefix", () {
      final tree = RadixTree<String>()
        ..insert("/blog", "Blog Home")
        ..insert("/blog/:slug", "Blog Post");

      final home = tree.get("/blog");
      final post = tree.get("/blog/flutter-tips");

      expect(home!.value, equals("Blog Home"));
      expect(post!.value, equals("Blog Post"));
      expect(post.params, equals({"slug": "flutter-tips"}));
    });

    group("getLongestLiteralMatch", () {
      test("should return exact match for full path", () {
        final tree = RadixTree<String>()..insert("product/:id/details/screen", "Handler A");

        final result = tree.getLongestLiteralMatch("product/:id/details/screen");
        expect(result, isNotNull);
        expect(result!.value, equals("Handler A"));
      });

      test("should return deepest matching literal prefix", () {
        final tree = RadixTree<String>()
          ..insert("product", "Root")
          ..insert("product/:id", "Level 1")
          ..insert("product/:id/details", "Level 2");

        final result = tree.getLongestLiteralMatch("product/:id/details/screen/config");
        expect(result, isNotNull);
        expect(result!.value, equals("Level 2"));
      });

      test("should return top-level match if only it matches", () {
        final tree = RadixTree<String>()..insert("product", "Root");

        final result = tree.getLongestLiteralMatch("product/:id/details");
        expect(result, isNotNull);
        expect(result!.value, equals("Root"));
      });

      test("should return null if no segments match", () {
        final tree = RadixTree<String>()..insert("home", "Home");

        final result = tree.getLongestLiteralMatch("about/us");
        expect(result, isNull);
      });

      test("should return null for completely empty tree", () {
        final tree = RadixTree<String>();

        final result = tree.getLongestLiteralMatch("any/path/here");
        expect(result, isNull);
      });
    });
  });
}
