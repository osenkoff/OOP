import 'package:lab3/television/actions/tv_command.dart';

import '../controller.dart';

class TvAction {
  final Controller controller;

  TvAction(this.controller);

  void executeCommand(String action, dynamic firstValue, dynamic secondValue) {
    Command? receivedAction = _createCommand(action, firstValue, secondValue);
    if (receivedAction != null) {
      receivedAction.execute();
      return;
    }

    throw new Exception("Unavailable action received");
  }

  Command? _createCommand(String action, dynamic firstValue, dynamic secondValue) {
    switch (action) {
      case "TurnOn":
        return TurnOnCommand(controller);
      case "TurnOff":
        return TurnOffCommand(controller);
      case "SelectChannel":
        return SelectChannelCommand(controller, firstValue);
      case "SelectPreviousChannel":
        return SelectPreviousChannelCommand(controller);
      case "SetChannelName":
        return SetChannelNameCommand(controller, firstValue as int, secondValue as String);
      case "DeleteChannelName":
        return DeleteChannelNameCommand(controller, firstValue as String);
      case "GetChannelName":
        return GetChannelNameCommand(controller, firstValue);
      case "GetChannelByName":
        return GetChannelByNameCommand(controller, firstValue as String);
      case "Info":
        return InfoCommand(controller);
      default:
        return null;
    }
  }
}