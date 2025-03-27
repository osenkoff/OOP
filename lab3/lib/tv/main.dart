import 'package:args/command_runner.dart';

import 'commands/television_controller.dart';

void main(List<String> args) async {
  var runner = CommandRunner('television', 'Execute program that work with tv')
    ..addCommand(TelevisionController());

  try {
    await runner.run(args);
  } catch (e) {
    print(e);
  }
}
