import 'package:lab3/television/television.dart';
import 'package:test/test.dart';

void main() {
  late Television television;

  setUp(() {
    television = Television();
  });

  group('States initialization', () {
    test('Checking initial states', () {
      expect(television.isTurnOn, isFalse);
      expect(television.currentChannel, 1);
      expect(television.previousChannel, isNull);
      expect(television.channelsList, isEmpty);
    });

    test('Checking initial states if TV is on', () {
      television.turnOn();
      expect(television.isTurnOn, isTrue);
      expect(television.currentChannel, 1);
      expect(television.previousChannel, isNull);
      expect(television.channelsList, isEmpty);
    });
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

    test('Сan’t turn on the TV if it’s already on.', () {
      television.turnOn();
      expect(() => television.turnOn(), throwsException);
    });

    test('Can’t turn on the TV if it’s already off.', () {
      expect(() => television.turnOff(), throwsException);
    });
  });

  group('Channel selection', () {
    setUp(() {
      television.turnOn();
    });

    test('Can select valid int channel', () {
      television.selectChannel(5);
      expect(television.currentChannel, 5);
    });

    test('Can not select invalid int channel', () {
      expect(() => television.selectChannel(0), throwsException);
      expect(() => television.selectChannel(100), throwsException);
    });

    test('Can select existing channel by name', () {
      television.setChannelName(7, 'Carousel');
      expect(television.currentChannel, 1);
      television.selectChannel('Carousel');
      expect(television.currentChannel, 7);
    });

    test('Can’t select non-existing channel', () {
      expect(() => television.selectChannel('Carousel'), throwsException);
    });

    test('Select previous channel', () {
      television.selectChannel(3);
      television.selectChannel(5);
      television.selectPreviousChannel();
      expect(television.currentChannel, 3);
      expect(television.previousChannel, isNull);
    });

    test('Сan’t switch to the previous channel', () {
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
      expect(television.channelsList[7], 'National Geographic');
    });

    test('Can delete existing channel name', () {
      television.deleteChannelName('MTV');
      expect(television.channelsList.containsKey(1), isFalse);
    });

    test('Сan’t delete non-existing channel name', () {
      expect(() => television.deleteChannelName('CNN'), throwsException);
    });

    test('Can get channel name', () {
      expect(television.getChannelName(1), 'MTV');
    });

    test('Сan’t get non-existing channel name', () {
      expect(() => television.getChannelName(4), throwsException);
    });

    test('Can get channel by name', () {
      expect(television.getChannelByName('BBC'), 2);
    });

    test('Сan’t get non-existing channel by name', () {
      expect(() => television.getChannelByName('TV100'), throwsException);
    });

    test('National Geographic channel scenario', () {
      expect(television.getChannelName(7), 'National Geographic');
      expect(television.getChannelByName('National Geographic'), 7);
    });
  });
}
