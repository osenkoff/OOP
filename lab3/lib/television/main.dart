import 'package:args/command_runner.dart';

import 'commands/tv_parameters_command.dart';

void main(List<String> args) async {
  var runner = CommandRunner('television', 'Execute program that work with tv')
    ..addCommand(TvParametersCommand());

  try {
    await runner.run(args);
  } catch (e) {
    print(e);
  }
}
