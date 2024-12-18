import 'dart:math';

import 'attributes.dart';
import 'element.dart';
import 'tags.dart';
import 'unsafe_raw.dart';

//NOTE: there might be a better way to do this
final _random = Random();

sealed class Command implements Element {
  const Command();

  static String generateFuncName() => "_eval_${_randomString(8)}";

  static String _randomString(int length) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(
            length, (index) => characters[_random.nextInt(characters.length)])
        .join();
  }
}

final class SimpleCommand extends Command {
  const SimpleCommand(this.js);
  final String js;
  @override
  void render(StringBuffer sb) {
    sb.write("$js;");
  }
}

final class ComplexCommand extends Command {
  ComplexCommand(this.js);

  ComplexCommand._(this.js, this._name);

  final String js;
  String? _name;

  (String, Element) call() {
    final name = Command.generateFuncName();
    return (name, ComplexCommand._(js, name));
  }

  @override
  void render(StringBuffer sb) {
    if (_name == null) {
      throw Exception(
        "Complex Command has not been initialised. You need to call the call method",
      );
    }

    final content = """
		function $_name(self, event) {
				let e = event;
				$js
		}""";
    final element = script([id(_name!), UnsafeRaw(content)]);
    element.render(sb);
  }
}
