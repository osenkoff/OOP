import 'television.dart';

class TvController {
  late final Television television;

  TvController(Television television) {
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

    television.turnOn();
    message = 'TV is turned on';

    return message;
  }

  String turnOff() {
    String message = '';

    television.turnOff();
    message = 'TV is turned off';

    return message;
  }

  String selectChannel(dynamic channel) {
    String message = '';

    television.selectChannel(channel);
    message = 'Channel switched to: $channel';

    return message;
  }

  String selectPreviousChannel() {
    String message = '';

    television.selectPreviousChannel();
    message = 'Switched to previous channel';

    return message;
  }

  String setChannelName(int channel, String channelName) {
    String message = '';

    television.setChannelName(channel, channelName);
    message = 'Channel name set: $channel - $channelName';

    return message;
  }

  String deleteChannelName(String channelName) {
    String message = '';

    television.deleteChannelName(channelName);
    message = 'Channel name deleted: $channelName';

    return message;
  }

  String getChannelName(int channel) {
    String message = '';

    String? channelName = television.getChannelName(channel);
    message = 'Channel $channel name: $channelName';

    return message;
  }

  String getChannelByName(String channelName) {
    String message = '';

    int channel = television.getChannelByName(channelName);
    message = 'Channel for name $channelName: $channel';

    return message;
  }
}
