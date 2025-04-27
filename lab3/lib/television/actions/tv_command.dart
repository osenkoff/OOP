import '../tv_controller.dart';

abstract class Command {
  void execute();
}

class TurnOnCommand implements Command {
  final TvController controller;

  TurnOnCommand(this.controller);

  @override
  void execute() {
    print(controller.turnOn());
  }
}

class TurnOffCommand implements Command {
  final TvController controller;

  TurnOffCommand(this.controller);

  @override
  void execute() {
    print(controller.turnOff());
  }
}

class SelectChannelCommand<T> implements Command {
  final TvController controller;
  final T channel;

  SelectChannelCommand(this.controller, this.channel);

  @override
  void execute() {
    print(controller.selectChannel<T>(channel));
  }
}

class SelectPreviousChannelCommand implements Command {
  final TvController controller;

  SelectPreviousChannelCommand(this.controller);

  @override
  void execute() {
    print(controller.selectPreviousChannel());
  }
}

class SetChannelNameCommand implements Command {
  final TvController controller;
  final int channel;
  final String channelName;

  SetChannelNameCommand(this.controller, this.channel, this.channelName);

  @override
  void execute() {
    print(controller.setChannelName(channel, channelName));
  }
}

class DeleteChannelNameCommand implements Command {
  final TvController controller;
  final String channelName;

  DeleteChannelNameCommand(this.controller, this.channelName);

  @override
  void execute() {
    print(controller.deleteChannelName(channelName));
  }
}

class GetChannelNameCommand implements Command {
  final TvController controller;
  final int channel;

  GetChannelNameCommand(this.controller, this.channel);

  @override
  void execute() {
    print(controller.getChannelName(channel));
  }
}

class GetChannelByNameCommand implements Command {
  final TvController controller;
  final String channelName;

  GetChannelByNameCommand(this.controller, this.channelName);

  @override
  void execute() {
    print(controller.getChannelByName(channelName));
  }
}

class InfoCommand implements Command {
  final TvController controller;

  InfoCommand(this.controller);

  @override
  void execute() {
    print(controller.getInfo());
  }
}