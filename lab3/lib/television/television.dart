class Television {
  bool _isTurnOn = false;
  int _currentChannel = 1;
  int? _previousChannel;
  Map<int, String> _channelsList = {};

  bool get isTurnOn => _isTurnOn;
  int get currentChannel => _currentChannel;
  int? get previousChannel => _previousChannel;
  Map<int, String> get channelsList => _channelsList;

  void turnOn() {
    if (_isTurnOn) throw Exception('TV is already on');

    _isTurnOn = true;
  }

  void turnOff() {
    if (!_isTurnOn) throw Exception('TV is already off');

    _isTurnOn = false;
  }

  void selectChannel(dynamic channel) {
    if (!_isTurnOn) throw Exception('can not select a channel when TV is off');

    if (channel is int) {
      if (!isValidChannel(channel)) throw Exception('unavailable channel selected');

      _previousChannel = _currentChannel;
      _currentChannel = channel;
    }

    if (channel is String) {
      if (!_channelsList.containsValue(channel)) throw Exception('unavailable channel selected');;

      _currentChannel = _channelsList.keys
          .firstWhere((key) => _channelsList[key] == channel);
    }
  }

  void selectPreviousChannel() {
    if (!_isTurnOn || _previousChannel == null) throw Exception('can not select a previous channel');

    _currentChannel = _previousChannel!;
    _previousChannel = null;
  }

  void setChannelName(int channel, String channelName) {
    if (!_isTurnOn || !isValidChannel(channel)) throw Exception('can not set channel name');

    _channelsList[channel] = channelName;
  }

  void deleteChannelName(String channelName) {
    if (!_channelsList.containsValue(channelName)) throw Exception('channel does not exist name');

    _channelsList
        .removeWhere((channel, channelName) => channelName == channelName);
  }

  bool isValidChannel(int channel) {
    return channel >= 1 && channel <= 99;
  }

  String? getChannelName(int channel) {
    if (!_channelsList.containsKey(channel)) throw Exception('this channel does not have a name');

    return _channelsList[channel];
  }

  int getChannelByName(String channelName) {
    if (!_channelsList.containsValue(channelName)) throw Exception('this channel does not have a name');

    int channel = _channelsList.keys
        .firstWhere((key) => _channelsList[key] == channelName);

    return channel;
  }
}
