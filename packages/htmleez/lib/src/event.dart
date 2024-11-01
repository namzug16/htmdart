import 'command.dart';
import 'element.dart';

final class Event implements Element {
  Event(this.name);

  Event._(this.name, this._funcNames, this._commands);

  final String name;
  List<String>? _funcNames;
  List<Command>? _commands;

  ElementSet call(List<Command> commands) {
    final sCmds = <SimpleCommand>[];
    final cCmds = <Element>[];
    final funcNames = <String>[];

    for (int i = 0; i < commands.length; i++) {
      switch (commands[i]) {
        case SimpleCommand():
          sCmds.add(commands[i] as SimpleCommand);
        case ComplexCommand():
          final (funcName, cmd) = (commands[i] as ComplexCommand)();
          funcNames.add(funcName);
          cCmds.add(cmd);
      }
    }

    return ElementSet([Event._(name, funcNames, sCmds), ...cCmds]);
  }

  @override
  void render(StringBuffer sb) {
    if (_funcNames == null || _commands == null) {
      throw Exception(
        "Event has not been initialised. You need to call the call method for $name",
      );
    }

    sb.write(' $name="');
    if (_commands!.isNotEmpty) {
      sb.write("var self=this;var e=event;");
      for (int i = 0; i < _commands!.length; i++) {
        _commands![i].render(sb);
      }
    }

    if (_funcNames!.isNotEmpty) {
      for (int i = 0; i < _funcNames!.length; i++) {
        sb.write('${_funcNames![i]}(this, event);');
      }
    }

    sb.write('"');
  }
}
