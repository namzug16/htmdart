import "package:htmleez/src/markup_component.dart";

//
// ignore: one_member_abstracts
abstract class MarkupRenderer {
  String call(List<MarkupComponent> content);
}
