import 'package:args/command_runner.dart';

import './commands/choose_command.dart';

void main(List<String> args) async {
  var runner = CommandRunner('action', 'run the chosen action')
    ..addCommand(ChooseActionCommand());

  try {
    await runner.run(args);
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}