import 'package:lab3/television/television.dart';
import 'package:test/test.dart';

void main() {
  late Television television;

  setUp(() {
    television = Television();
  });

  group('TV power manager', () {
    test('Turn on TV', () {
      television.turnOn();
      expect(television.isTurnOn, isTrue);
    });

    test('Turn off TV', () {
      television.turnOn();
      television.turnOff();
      expect(television.isTurnOn, isFalse);
    });

    test('Throw exception when turning on already on TV', () {
      television.turnOn();
      expect(() => television.turnOn(), throwsException);
    });

    test('Throw exception when turning off already off TV', () {
      expect(() => television.turnOff(), throwsException);
    });
  });

  group('Channel selection', () {
    setUp(() {
      television.turnOn();
    });

    test('Select valid int channel', () {
      television.selectChannel(5);
      expect(television.currentChannel, 5);
    });

    test('Select invalid int channel', () {
      expect(() => television.selectChannel(0), throwsException);
      expect(() => television.selectChannel(100), throwsException);
    });

    test('Select channel by name', () {
      television.setChannelName(7, 'Carousel');
      television.selectChannel('Carousel');
      expect(television.currentChannel, 7);
    });

    test('Throw exception when selecting non-existing channel name', () {
      expect(() => television.selectChannel('Carousel'), throwsException);
    });

    test('Select previous channel', () {
      television.selectChannel(3);
      television.selectChannel(5);
      television.selectPreviousChannel();
      expect(television.currentChannel, 3);
      expect(television.previousChannel, isNull);
    });

    test('Throw exception when selecting previous channel without history', () {
      expect(() => television.selectPreviousChannel(), throwsException);
    });
  });

  group('Channel Management:', () {
    setUp(() {
      television.turnOn();
      television.setChannelName(1, 'MTV');
      television.setChannelName(2, 'BBC');
      television.setChannelName(7, 'National Geographic');
    });

    test('Set channel name', () {
      expect(television.channelsList[1], 'MTV');
      expect(television.channelsList[2], 'BBC');
    });

    test('Delete channel name', () {
      television.deleteChannelName('MTV');
      expect(television.channelsList.containsKey(1), isFalse);
    });

    test('Throw exception when deleting non-existing channel name', () {
      expect(() => television.deleteChannelName('CNN'), throwsException);
    });

    test('Check valid channel', () {
      expect(television.isValidChannel(1), isTrue);
      expect(television.isValidChannel(100), isFalse);
    });

    test('Get channel name', () {
      expect(television.getChannelName(1), 'MTV');
      expect(() => television.getChannelName(3), throwsException);
    });

    test('Get channel by name', () {
      expect(television.getChannelByName('BBC'), 2);
      expect(() => television.getChannelByName('CNN'), throwsException);
    });

    test('National Geographic channel scenario', () {
      expect(television.getChannelName(7), 'National Geographic');
      expect(television.getChannelByName('National Geographic'), 7);
    });
  });
}
