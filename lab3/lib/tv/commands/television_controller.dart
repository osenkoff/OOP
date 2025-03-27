import 'dart:io';

import 'package:args/command_runner.dart';

import 'package:lab3/tv/commands/television_response.dart';
import 'package:lab3/tv/utils/television_utils.dart';

class TelevisionController extends Command {
  final televisionResponse = TelevisionResponse();

  @override
  final name = 'television';

  @override
  final description = 'Execute program that work with tv';

  @override
  void run() {
    final actionList = getActionsFromConsole();

    for (var action in actionList) {
      final parsedAction = parseActionList(action);
      final executeAction = parsedAction[0];

      String channel = '';
      String channelName = '';

      if (executeAction == TelevisionUtils.setChannelName || executeAction == TelevisionUtils.selectChannel) {
        channel = parsedAction.length > 1 ? parsedAction[1] : '';
        channelName = parsedAction.length > 2 ? parsedAction.sublist(2).join(' ') : '';
      } else if (executeAction == TelevisionUtils.deleteChannelName || executeAction == TelevisionUtils.getChannelByName) {
        channelName = parsedAction.length > 1 ? parsedAction.sublist(1).join(' ') : '';
      } else {
        channel = parsedAction.length > 1 ? parsedAction[1] : '';
      }

      String result = runCommand(executeAction, channel, channelName);
      print(result);
    }
  }

  String runCommand(String action, String? channel, [String? channelName]) {
    switch (action) {
      case TelevisionUtils.turnOn:
        return televisionResponse.televisionOn();
      case TelevisionUtils.turnOff:
        return televisionResponse.televisionOff();
      case TelevisionUtils.selectChannel:
        return televisionResponse.selectChannel(channel!);
      case TelevisionUtils.selectPreviousChannel:
        return televisionResponse.selectPreviousChannel();
      case TelevisionUtils.setChannelName:
        return televisionResponse.setChannelName(channel!, channelName!);
      case TelevisionUtils.deleteChannelName:
        return televisionResponse.deleteChannelName(channelName!);
      case TelevisionUtils.getChannelName:
        return televisionResponse.getChannelName(channel!);
      case TelevisionUtils.getChannelByName:
        return televisionResponse.getChannelByName(channelName!);
      case TelevisionUtils.info:
        return televisionResponse.getInfo();
      default:
        throw Exception("Unavailable action received");
    }
  }

  List<String> getActionsFromConsole() {
    List<String> actions = [];

    while (true) {
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) break;
      actions.add(input);
    }

    return actions;
  }

  List<String> parseActionList(String action) {
    return action.split(' ');
  }
}
