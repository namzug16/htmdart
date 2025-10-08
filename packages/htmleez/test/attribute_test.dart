import "package:htmleez/htmleez.dart";
import "package:test/test.dart";

void main() {
  group("Attribute HTML", () {
    test("Basic Rendering - Flag Attribute", () {
      final component = div([const Attribute("disabled")()]);
      expect(component.toHtml(), "<div disabled></div>");
    });

    test("Attribute with Value", () {
      final component = div([const Attribute("id")("my-id")]);
      expect(component.toHtml(), '<div id="my-id"></div>');
    });

    test("Attribute with value equal to key", () {
      final component = div([const Attribute("name")("name")]);
      expect(
        component.toHtml(),
        '<div name="name"></div>',
      );
    });

    test("Escaped Attribute Content", () {
      const input = 'This "title" has <special> & characters';
      const escaped = "This &quot;title&quot; has &lt;special&gt; &amp; characters";
      final component = div([const Attribute("title")(input)]);
      expect(component.toHtml(), '<div title="$escaped"></div>');
    });

    test("Raw Attribute does not escape content (e.g. for JS)", () {
      final component = div([const RawAttributeComponent("onclick", 'console.log("hello")')]);
      expect(component.toHtml(), '<div onclick="console.log("hello")"></div>');
    });

    test("Multiple Attributes", () {
      const titleInput = 'Test "multiple" <attributes> & more';
      const titleEscaped = "Test &quot;multiple&quot; &lt;attributes&gt; &amp; more";
      final component = div([
        const Attribute("id")("main"),
        const Attribute("disabled")(),
        const Attribute("title")(titleInput),
      ]);
      expect(component.toHtml(), '<div id="main" disabled title="$titleEscaped"></div>');
    });
  });
}
