
import 'attribute.dart';
import "command.dart";
import "identifiable_component.dart";
import "markup_component.dart";
import "tags.dart";
import "unsafe_raw.dart";

final class Event {
  Event(this.name);

  final String name;

  MarkupComponentSet call(List<Command> commands) {
    final attribute = Attribute(name);
    final scripts = <MarkupComponent>[];
    var attributeContent = "var self=this;var e=event;";

    for (int i = 0; i < commands.length; i++) {
      final c = commands[i];
      switch (c) {
        case SimpleCommand():
          attributeContent += "${c.js};";
        case ComplexCommand():
          final cmd = (commands[i] as ComplexCommand)();
          attributeContent += '${cmd.name}(this, event);';
          final scriptContent = """function ${cmd.name}(self, event) {
              let e = event;
              ${cmd.js}
          }""";
          scripts.add(script([id(cmd.name!), UnsafeRaw(scriptContent)]));
      }
    }

    return MarkupComponentSet([attribute(attributeContent), ...scripts]);
  }
}
