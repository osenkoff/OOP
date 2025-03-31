import 'television.dart';

class Controller {
  late final Television television;

  Controller(Television television) {
    this.television = television;
  }

  String getInfo() {
    if (!television.isTurnOn) return 'TV is turned off';

    List<String> message = ['TV is turned on'];
    message.add('Channel is: ${television.currentChannel}');

    if (television.channelsList.isNotEmpty) {
      television.channelsList.forEach((channel, channelName) {
        message.add('$channel - $channelName');
      });
    }

    return message.join('\n');
  }

  String turnOn() {
    String message = '';

    if (television.turnOnTelevision()) {
      message = 'TV is turned on';
    } else {
      throw new Exception('ERROR: TV is already on');
    }

    return message;
  }

  String turnOff() {
    String message = '';

    if (television.turnOffTelevision()) {
      message = 'TV is turned off';
    } else {
      throw new Exception('ERROR: TV is already off');
    }

    return message;
  }

  String selectChannel(dynamic channel) {
    String message = '';

    if (television.selectChannel(channel)) {
      message = 'Channel switched to: $channel';
    } else if (!television.isTelevisionTurnedOn()) {
      throw new Exception('ERROR: can not select a channel when TV is off');
    } else {
      throw new Exception('ERROR: unavailable channel selected');
    }

    return message;
  }

  String selectPreviousChannel() {
    String message = '';

    if (television.selectPreviousChannel()) {
      message = 'Switched to previous channel';
    } else if (!television.isTelevisionTurnedOn()) {
      throw new Exception('ERROR: can not select a previous channel if TV is off');
    } else {
      throw new Exception('ERROR: unavailable to switch back');
    }

    return message;
  }

  String setChannelName(int channel, String channelName) {
    String message = '';

    if (television.setChannelName(channel, channelName)) {
      message = 'Channel name set: $channel - $channelName';
    } else if (!television.isTelevisionTurnedOn()) {
      throw new Exception('ERROR: can not set channel name when TV is off');
    } else {
      throw new Exception('ERROR: unavailable to set channel name');
    }

    return message;
  }

  String deleteChannelName(String channelName) {
    String message = '';

    if (television.deleteChannelName(channelName)) {
      message = 'Channel name deleted: $channelName';
    } else if (!television.isTelevisionTurnedOn()) {
      throw new Exception('ERROR: can not delete channel name when TV is off');
    } else {
      throw new Exception('ERROR: this channel do not have a name');
    }

    return message;
  }

  String getChannelName(int channel) {
    String message = '';

    if (television.isChannelExist(channel)) {
      String? channelName = television.getChannelName(channel);
      message = 'Channel $channel name: $channelName';
    } else if (!television.isTelevisionTurnedOn()) {
      throw new Exception('ERROR: can not get channel name when TV is off');
    } else {
      throw new Exception('ERROR: channel does not exist a name');
    }

    return message;
  }

  String getChannelByName(String channelName) {
    String message = '';

    if (television.isChannelNameExist(channelName)) {
      int channel = television.getChannelByName(channelName);
      message = 'Channel for name $channelName: $channel';
    } else if (!television.isTelevisionTurnedOn()) {
      throw new Exception('ERROR: can not get channel when TV is off');
    } else {
      throw new Exception('ERROR: channel does not exist');
    }

    return message;
  }
}
