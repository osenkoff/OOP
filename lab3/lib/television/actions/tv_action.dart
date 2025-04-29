import 'package:lab3/television/actions/tv_command.dart';
import '../tv_controller.dart';

class TvAction {
  final TvController controller;

  TvAction(this.controller);

  void executeCommand<T1, T2>(String action, T1 firstValue, T2 secondValue) {
    Command? receivedAction =
        _parseCommand<T1, T2>(action, firstValue, secondValue);
    if (receivedAction != null) {
      receivedAction.execute();
      return;
    }

    throw Exception('Unavailable action received');
  }

  Command? _parseCommand<T1, T2>(String action, T1 firstValue, T2 secondValue) {
    switch (action) {
      case 'TurnOn':
        return TurnOnCommand(controller);
      case 'TurnOff':
        return TurnOffCommand(controller);
      case 'SelectChannel':
        return SelectChannelCommand<T1>(controller, firstValue);
      case 'SelectPreviousChannel':
        return SelectPreviousChannelCommand(controller);
      case 'SetChannelName':
        if (firstValue is int && secondValue is String)
          return SetChannelNameCommand(controller, firstValue, secondValue);

        throw Exception('Invalid types for SetChannelName');
      case 'DeleteChannelName':
        if (firstValue is String)
          return DeleteChannelNameCommand(controller, firstValue);

        throw Exception('Invalid type for DeleteChannelName');
      case 'GetChannelName':
        if (firstValue is int)
          return GetChannelNameCommand(controller, firstValue);

        throw Exception('Invalid type for GetChannelName');
      case 'GetChannelByName':
        if (firstValue is String)
          return GetChannelByNameCommand(controller, firstValue);

        throw Exception('Invalid type for GetChannelByName');
      case 'Info':
        return InfoCommand(controller);
      default:
        return null;
    }
  }
}
