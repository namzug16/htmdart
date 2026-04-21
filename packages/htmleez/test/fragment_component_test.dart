import "package:htmleez/htmleez.dart";
import "package:test/test.dart";

void main() {
  group("Fragment HTML", () {
    test("Renders top-level fragment with sibling tags", () {
      final component = HtmlComponent.fragment([
        h1(["Welcome".t]),
        p(["This is a paragraph".t]),
      ]);

      expect(component.toHtml(), "<h1>Welcome</h1><p>This is a paragraph</p>");
    });

    test("Renders nested fragments at the root level", () {
      final component = HtmlComponent.fragment([
        HtmlComponent.fragment([
          p(["A".t]),
          p(["B".t]),
        ]),
        HtmlComponent.fragment([
          p(["C".t]),
        ]),
      ]);

      expect(component.toHtml(), "<p>A</p><p>B</p><p>C</p>");
    });

    test("Renders a fragment when used as a tag child", () {
      final component = div([
        HtmlComponent.fragment([
          "hello ".t,
          span(["world".t]),
        ]),
      ]);

      expect(component.toHtml(), "<div>hello <span>world</span></div>");
    });

    test("Renders deeply nested fragments inside a tag", () {
      final component = section([
        HtmlComponent.fragment([
          p(["First".t]),
          HtmlComponent.fragment([
            p(["Second".t]),
            const Raw("<hr/>"),
          ]),
        ]),
      ]);

      expect(component.toHtml(), "<section><p>First</p><p>Second</p><hr/></section>");
    });

    test("Renders an empty fragment as empty output", () {
      final component = HtmlComponent.fragment([]);
      expect(component.toHtml(), isEmpty);
    });

    test("Throws when root fragment contains an unsupported component", () {
      final component = HtmlComponent.fragment([
        $("id")("invalid-at-root"),
      ]);

      expect(component.toHtml, throwsException);
    });
  });
}
