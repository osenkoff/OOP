class Television {
  bool isTurnOn;
  String currentChannel;
  Map<String, String>? channelsList;

  Television({
    this.isTurnOn = false,
    this.currentChannel = '1',
    this.channelsList,
  });
}
