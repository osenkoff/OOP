class Television {
  bool isTurnOn = false;
  int currentChannel = 1;
  int? previousChannel;
  Map<int, String> channelsList = {};

  final List<int> validChannels = List.generate(99, (index) => index + 1);

  bool turnOnTelevision() {
    if (isTurnOn) return false;

    isTurnOn = true;
    return true;
  }

  bool turnOffTelevision() {
    if (!isTurnOn) return false;

    isTurnOn = false;
    return true;
  }

  bool selectChannel(dynamic channel) {
    if (!isTurnOn) return false;

    if (channel is int) {
      if (!validChannels.contains(channel)) return false;

      previousChannel = currentChannel;
      currentChannel = channel;
    }

    if (channel is String) {
      if (!channelsList.containsValue(channel)) return false;

      currentChannel = channelsList.keys
          .firstWhere((key) => channelsList[key] == channel);
    }

    return true;
  }

  bool isTelevisionTurnedOn() {
    return isTurnOn;
  }

  int getChannel() {
    return currentChannel;
  }

  bool selectPreviousChannel() {
    if (!isTurnOn || previousChannel == null) return false;

    currentChannel = previousChannel!;
    previousChannel = null;
    return true;
  }

  int getPreviousChannel() {
    return previousChannel!;
  }

  bool setChannelName(int channel, String channelName) {
    if (!validChannels.contains(channel) || !isTurnOn) return false;

    channelsList[channel] = channelName;
    return true;
  }

  bool deleteChannelName(String channelName) {
    if (!channelsList.containsValue(channelName)) return false;

    channelsList
        .removeWhere((channel, channelName) => channelName == channelName);
    return true;
  }

  bool isChannelExist(int channel) {
    if (!channelsList.containsKey(channel)) return false;

    return true;
  }

  String? getChannelName(int channel) {
    return channelsList[channel];
  }

  bool isChannelNameExist(String channelName) {
    if (!channelsList.containsValue(channelName)) return false;

    return true;
  }

  int getChannelByName(String channelName) {
    int channel = channelsList.keys
        .firstWhere((key) => channelsList[key] == channelName);

    return channel;
  }
}
