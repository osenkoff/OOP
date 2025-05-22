import 'package:lab3/car/car.dart';
import 'package:test/test.dart';

void main() {
  late Car car;

  setUp(() {
    car = Car();
  });

  group('Checking initial states', () {
    test('Initial states when engine is off', () {
      expect(car.isEngineOn, isFalse);
      expect(car.gear, Gear.neutral);
      expect(car.getDirection(), Direction.stand);
      expect(car.speed, 0);
    });

    test('Initial states when engine is on', () {
      car.turnOnEngine();

      expect(car.isEngineOn, isTrue);
      expect(car.gear, Gear.neutral);
      expect(car.getDirection(), Direction.stand);
      expect(car.speed, 0);
    });
  });

  group('Engine statements', () {
    test('Can`t turn engine on if it`s already on', () {
      car.turnOnEngine();

      expect(() => car.turnOnEngine(), throwsException);
    });

    test('Turn engine off', () {
      car.turnOnEngine();
      car.turnOffEngine();

      expect(car.isEngineOn, isFalse);
    });

    test('Can`t turn engine off if it`s already off', () {
      expect(() => car.turnOffEngine(), throwsException);
    });

    test('Can`t turn engine off if it`s not neutral gear', () {
      car.turnOnEngine();
      car.setGear(Gear.first);

      expect(() => car.turnOffEngine(), throwsException);
    });

    test('Can`t turn engine off if it`s not zero speed', () {
      car.turnOnEngine();
      car.setGear(Gear.first);
      car.setSpeed(10);

      expect(() => car.turnOffEngine(), throwsException);
    });
  });

  group('Movement statements', () {
    setUp(() {
      car.turnOnEngine();
    });

    test('Set up a gear in available speed range', () {
      car.setGear(Gear.first);

      expect(car.gear.value, 1);
    });

    test('Set up a gear', () {
      car.setGear(Gear.first);
      expect(car.gear.value, 1);

      car.setSpeed(25);
      car.setGear(Gear.second);
      expect(car.gear.value, 2);

      car.setSpeed(40);
      car.setGear(Gear.third);
      expect(car.gear.value, 3);

      car.setSpeed(60);
      car.setGear(Gear.fourth);
      expect(car.gear.value, 4);

      car.setSpeed(90);
      car.setGear(Gear.fifth);
      expect(car.gear.value, 5);

    });

    test('Can`t set a gear if speed out of range', () {
      expect(() => car.setGear(Gear.second), throwsException);
    });

    test('Can`t set a speed if it`s out of gear range', () {
      car.setGear(Gear.first);
      expect(() => car.setSpeed(40), throwsException);
    });

    test('Get a standing still direction', () {
      expect(car.getDirection(), Direction.stand);
    });

    test('Get a forward direction', () {
      car.setGear(Gear.first);
      car.setSpeed(10);

      expect(car.getDirection(), Direction.forward);
    });

    test('Get a back direction', () {
      car.setGear(Gear.reverse);
      car.setSpeed(10);

      expect(car.getDirection(), Direction.back);
    });
  });
}