import 'package:lab3/television/models/tv_options.dart';

class TvUtils {
  static const String turnOn = 'TurnOn';
  static const String turnOff = 'TurnOff';
  static const String selectChannel = 'SelectChannel';
  static const String info = 'Info';

  final List<String> channels = List.generate(99, (index) => (index + 1).toString());

  bool isTurnOn = false;
  String currentChannel = '1';
  List<String> actionSequence = [];

  String getTvStatus(String action) {
    if (action == turnOn && !isTurnOn) {
      isTurnOn = true;
      return _addAction('TV is turned on');
    }

    if (action == turnOff && isTurnOn) {
      isTurnOn = false;
      return _addAction('TV is turned off');
    }
    
    if (action == info) {
      if (isTurnOn) {
        return _addAction('TV is turned on\nChannel is: $currentChannel');
      }

      return _addAction('TV is turned off');
    }

    return _addAction('ERROR');
  }

  String getTvChannel(String action) {
    String receivedChannel = action.split(' ')[1];

    if (isTurnOn && channels.contains(receivedChannel)) {
      currentChannel = receivedChannel;
      return _addAction('Channel switched to: $currentChannel');
    }

    _addAction('ERROR');
    return currentChannel;
  }

  TvOptions setTvOptions(List<String> actionsList) {
    String? status;
    String channel = currentChannel;

    for (var action in actionsList) {
      if ({turnOn, turnOff, info}.contains(action)) {
        status = getTvStatus(action);
        continue;
      }

      if (action.startsWith('SelectChannel')) {
        channel = getTvChannel(action);
        continue;
      }

      actionSequence.add('ERROR');
    }

    return TvOptions(
      status: status,
      channel: channel,
      actionSequence: actionSequence,
    );
  }

  String _addAction(String status) {
    actionSequence.add(status);
    return status;
  }
}
