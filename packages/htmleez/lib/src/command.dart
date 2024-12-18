import 'dart:math';

//NOTE: there might be a better way to do this
final _random = Random();

sealed class Command {
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
}

final class ComplexCommand extends Command {
  ComplexCommand(this.js);

  ComplexCommand._(this.js, this.name);

  final String js;
  String? name;

  ComplexCommand call() {
    final name = Command.generateFuncName();
    return ComplexCommand._(js, name);
  }
}
