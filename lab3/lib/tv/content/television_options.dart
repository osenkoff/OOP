import 'package:lab3/tv/utils/television_utils.dart';

import '../models/television.dart';

class TelevisionOptions {
  final Television television;

  TelevisionOptions(this.television);

  bool turnOn() {
    if (television.isTurnOn) return false;

    television.isTurnOn = true;
    return true;
  }

  bool turnOff() {
    if (!television.isTurnOn) return false;

    television.isTurnOn = false;
    return true;
  }

  bool selectChannel(String channel) {
    if (!TelevisionUtils.availableChannels.contains(channel)) return false;

    TelevisionUtils.previousChannels.add(television.currentChannel);

    television.currentChannel = channel;
    return true;
  }

  bool selectPreviousChannel() {
    if (!television.isTurnOn || TelevisionUtils.previousChannels.isEmpty) return false;

    television.currentChannel = TelevisionUtils.previousChannels.removeLast();
    return true;
  }

  bool setChannelName(String channel, String channelName) {
    if (!television.isTurnOn || !TelevisionUtils.availableChannels.contains(channel)) return false;

    television.channelsList ??= {};
    television.channelsList![channel] = channelName;
    return true;
  }
}
