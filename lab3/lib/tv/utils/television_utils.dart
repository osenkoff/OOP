class TelevisionUtils {
  static const String turnOn = 'TurnOn';
  static const String turnOff = 'TurnOff';
  static const String selectChannel = 'SelectChannel';
  static const String selectPreviousChannel = 'SelectPreviousChannel';
  static const String setChannelName = 'SetChannelName';
  static const String deleteChannelName = 'DeleteChannelName';
  static const String getChannelName = 'GetChannelName';
  static const String getChannelByName = 'GetChannelByName';
  static const String info = 'Info';

  static List<String> availableChannels =
      List.generate(99, (index) => (index + 1).toString());

  static List<String> previousChannels = [];
}
