import 'package:lab3/tv/content/television_options.dart';

import '../models/television.dart';

class TelevisionResponse {
  final television = Television();
  late TelevisionOptions televisionOptions;

  TelevisionResponse() {
    televisionOptions = TelevisionOptions(television);
  }

  String? getKeyByValue(Map<String, String>? map, String value) {
    if (map == null) return null;

    for (var entry in map.entries) {
      if (entry.value == value) {
        return entry.key;
      }
    }

    return null;
  }

  String getInfo() {
    if (!television.isTurnOn) return 'TV is turned off';

    List<String> lines = ['TV is turned on'];

    lines.add('Channel is: ${television.currentChannel}');

    if (television.channelsList != null && television.channelsList!.isNotEmpty) {
      television.channelsList?.forEach((channel, channelName) {
        lines.add('$channel - $channelName');
      });
    }

    return lines.join('\n');
  }

  String televisionOn() {
    if (televisionOptions.turnOn()) {
      return 'TV is turned on';
    }

    return 'ERROR';
  }

  String televisionOff() {
    if (televisionOptions.turnOff()) {
      return 'TV is turned off';
    }

    return 'ERROR';
  }

  String selectChannel(String channel) {
    if (!televisionOptions.turnOn() &&
        televisionOptions.selectChannel(channel)) {
      return 'Channel switched to: $channel';
    }

    return 'ERROR';
  }

  String selectPreviousChannel() {
    if (televisionOptions.selectPreviousChannel()) {
      return 'Channel switched to previous';
    }

    return 'ERROR';
  }

  String setChannelName(String channel, String channelName) {
    if (televisionOptions.setChannelName(channel, channelName)) {
      return 'Channel name set: $channel - $channelName';
    }

    return 'ERROR';
  }

  String deleteChannelName(String channelName) {
    if (television.channelsList!.containsValue(channelName)) {
      String? channel = getKeyByValue(television.channelsList, channelName);

      television.channelsList!.remove(channel);
      return 'Channel name deleted: $channelName';
    }

    return 'ERROR';
  }

  String getChannelName(String channel) {
    if (television.channelsList!.containsKey(channel)) {
      return 'Channel $channel name: ${television.channelsList![channel]}';
    }

    return 'ERROR';
  }

  String getChannelByName(String channelName) {
    if (television.channelsList!.containsValue(channelName)) {
      String? channel = getKeyByValue(television.channelsList, channelName);

      return 'Channel for name $channelName: $channel';
    }

    return 'ERROR';
  }
}
