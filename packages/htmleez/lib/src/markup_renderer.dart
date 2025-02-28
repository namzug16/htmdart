import 'markup_component.dart';

abstract class MarkupRenderer {
  String call(List<MarkupComponent> content);
}
