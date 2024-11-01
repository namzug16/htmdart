import 'element.dart';

final class UnsafeRaw implements Element {
  const UnsafeRaw(this.content);

  final String content;

  @override
  void render(StringBuffer sb) {
    sb.write(' $content');
  }
}
