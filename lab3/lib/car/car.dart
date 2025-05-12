import 'gear.dart';
import 'direction.dart';

class Car {
  bool _isEngineOn = false;
  Gear _gear = Gear.NEUTRAL;
  Direction _direction = Direction.STAND;
  int _speed = 0;
  Map<Gear, (int, int)> _gearInfo = {};

  bool get isEngineOn => _isEngineOn;
  Gear get gear => _gear;
  Direction get direction => _direction;
  int get speed => _speed;
  Map<Gear, (int, int)> get gearInfo => _gearInfo;

  Car() {
    _gearInfo.addAll({
      Gear.REVERSE: (0, 20),
      Gear.NEUTRAL: (-20, 150),
      Gear.FIRST: (0, 30),
      Gear.SECOND: (20, 50),
      Gear.THIRD: (30, 60),
      Gear.FOURTH: (40, 90),
      Gear.FIFTH: (50, 150),
    });
  }

  void turnOnEngine() {
    if (_isEngineOn) throw Exception('Engine is already on');
    _isEngineOn = true;
  }

  void turnOffEngine() {
    bool isCarMoving = (_speed != 0 || _gear != Gear.NEUTRAL);
    if (!_isEngineOn) throw Exception('The engine is already off');

    if (isCarMoving) throw Exception('Сar must be stopped and in neutral gear');

    _isEngineOn = false;
  }

  void setGear(Gear gear) {
    bool isInRangeOfCurrentSpeed = _isValidValue(gear, speed);

    if (!_isEngineOn) throw Exception('Сan`t set gear while engine is off');

    if (_isEngineOn && !isInRangeOfCurrentSpeed) throw Exception('Unsuitable current speed');

    if (!_isEngineOn && gear != Gear.NEUTRAL) throw Exception('');

    _gear = gear;
  }

  void setSpeed(int speed) {
    bool isInRangeOfCurrentSpeed = _isValidValue(_gear, speed);
    bool canSetNewSpeedOnNeutral = _gear == Gear.NEUTRAL && _speed.abs() < speed;

    if (!_isEngineOn) throw Exception('Cannot set speed while engine is off');

    if (_isEngineOn && !isInRangeOfCurrentSpeed) throw Exception('Unsuitable current speed');

    if (canSetNewSpeedOnNeutral) throw Exception('Can`t accelerate on neutral');

    if (speed < 0) throw Exception('Speed cannot be negative');

    _speed = speed;
    _direction = getDirection();
  }

  Direction getDirection() {
    if (_speed == 0) return Direction.STAND;

    bool isCarDrivingBack = _speed > 0 && _gear == Gear.REVERSE;
    return isCarDrivingBack ? Direction.BACK : Direction.FORWARD;
  }

  bool _isValidValue(Gear gear, int value) {
    final range = _gearInfo[gear];
    if (range == null) return false;
    final (min, max) = range;
    return value >= min && value <= max;
  }
}