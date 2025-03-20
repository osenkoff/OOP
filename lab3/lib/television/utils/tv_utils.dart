import 'package:lab3/television/models/tv_options.dart';

import '../models/tv_response.dart';

class TvUtils {
  static const String turnOn = 'TurnOn';
  static const String turnOff = 'TurnOff';
  static const String selectChannel = 'SelectChannel';
  static const String selectPreviousChannel = 'SelectPreviousChannel';
  static const String info = 'Info';

  final List<String> channels =
      List.generate(99, (index) => (index + 1).toString());

  String previousChannel = '';
  String currentChannel = '1';
  List<String> previousChannels = [];

  bool isTurnOn = false;
  List<String> actionSequence = [];

  String getTvStatus(String action) {
    if (action == turnOn && !isTurnOn) {
      isTurnOn = true;
      return 'TV is turned on';
    }

    if (action == turnOff && isTurnOn) {
      isTurnOn = false;
      return 'TV is turned off';
    }

    if (action == info) {
      return isTurnOn
          ? 'TV is turned on\nChannel is: $currentChannel'
          : 'TV is turned off';
    }

    return 'ERROR';
  }

  String getTvChannel(String action) {
    if (isTurnOn && action == selectPreviousChannel) {
      if (previousChannels.isNotEmpty) {
        currentChannel = previousChannel;
        previousChannel = previousChannels.removeLast();
        return 'Switched to previous channel: $currentChannel';
      }

      return 'ERROR';
    }

    if (action.startsWith(selectChannel)) {
      String receivedChannel = action.split(' ')[1];

      if (isTurnOn && channels.contains(receivedChannel)) {
        previousChannels.add(currentChannel);

        previousChannel = currentChannel;
        currentChannel = receivedChannel;
        return 'Channel switched to: $currentChannel';
      }
    }

    return 'ERROR';
  }

  TvResponse getTvResponse(List<String> actionsList) {
    List<TvOptions> responses = [];

    for (var action in actionsList) {
      String status = 'ERROR';
      String channel = currentChannel;

      if ({turnOn, turnOff, info}.contains(action)) {
        status = getTvStatus(action);
      } else if (action.startsWith(selectChannel) ||
          action == selectPreviousChannel) {
        status = getTvChannel(action);
        channel = currentChannel;
      }

      responses.add(TvOptions(status: status, channel: channel));
    }

    return TvResponse(responses: responses);
  }
}
