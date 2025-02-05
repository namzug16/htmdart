import 'package:htmleez/htmleez.dart';
import 'package:test/test.dart';

void main() {
  group('Attribute HTML', () {
    final render = HtmlRenderer();

    test('Basic Rendering - Flag Attribute', () {
      final component = div([Attribute("disabled")()]);
      expect(render.render(component), "<!DOCTYPE html> <div disabled></div>");
    });

    test('Attribute with Value', () {
      final component = div([Attribute("id")("my-id")]);
      expect(render.render(component), '<!DOCTYPE html> <div id="my-id"></div>');
    });

    test('Attribute with value equal to key', () {
      final component = div([Attribute("name")("name")]);
      expect(
          render.render(component), '<!DOCTYPE html> <div name="name"></div>');
    });

    test('Escaped Attribute Content', () {
      final input = 'This "title" has <special> & characters';
      final escaped = 'This &quot;title&quot; has &lt;special&gt; &amp; characters';
      final component = div([Attribute("title")(input)]);
      expect(render.render(component), '<!DOCTYPE html> <div title="$escaped"></div>');
    });

    test('Raw Attribute does not escape content (e.g. for JS)', () {
      final component = div([RawAttributeMarkupComponent("onclick", 'console.log("hello")')]);
      expect(render.render(component), '<!DOCTYPE html> <div onclick="console.log("hello")"></div>');
    });

    test('Multiple Attributes', () {
      final titleInput = 'Test "multiple" <attributes> & more';
      final titleEscaped = 'Test &quot;multiple&quot; &lt;attributes&gt; &amp; more';
      final component = div([
        Attribute("id")("main"),
        Attribute("disabled")(),
        Attribute("title")(titleInput),
      ]);
      expect(render.render(component), '<!DOCTYPE html> <div id="main" disabled title="$titleEscaped"></div>');
    });
  });
}
