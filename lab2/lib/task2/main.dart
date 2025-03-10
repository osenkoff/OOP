import 'package:args/command_runner.dart';

import 'commands/choose_function.dart';

void main(List<String> args) async {
  var runner = CommandRunner('function', 'execute the chosen function')
    ..addCommand(ChooseFunctionCommand());

  try {
    await runner.run(args);
  } catch (e) {
    print(e);
  }
}
