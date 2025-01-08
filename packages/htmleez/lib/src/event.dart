import 'attribute.dart';
import "attributes.dart";
import "command.dart";
import "html_component.dart";
import "tags.dart";
import "unsafe_raw.dart";

final class Event {
  Event(this.name);

  final String name;

  HtmlComponentSet call(List<Command> commands) {
    final attribute = Attribute(name);
    final scripts = <HtmlComponent>[];
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

    return HtmlComponentSet([attribute(attributeContent), ...scripts]);
  }
}
