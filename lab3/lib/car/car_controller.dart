import 'car.dart';

class CarController {
  late final Car car;

  CarController(this.car);

  String getInfo() {
    String message = '';

    message += 'Engine: ${car.isEngineOn ? 'on' : 'off'}\n';
    message += 'Direction: ${car.getDirection()}';
    message += 'Speed: ${car.speed}\n';
    message += 'Gear: ${car.gear.value}';

    return message;
  }

  String turnOn() {
    String message = '';

    car.turnOnEngine();
    message = 'The engine is turned on';

    return message;
  }

  String turnOff() {
    String message = '';

    car.turnOffEngine();
    message = 'The engine is turned off';

    return message;
  }

  String setGear(int gear) {
    String message = '';

    Gear bufferGear = Gear.values[gear + 1];
    car.setGear(bufferGear);
    message = 'Gear switched to: $bufferGear';

    return message;
  }

  String setSpeed(int speed) {
    String message = '';

    car.setSpeed(speed);
    message = 'Current speed is: $speed';

    return message;
  }
}
