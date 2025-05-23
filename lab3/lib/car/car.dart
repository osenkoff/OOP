enum Gear {
  reverse(-1),
  neutral(0),
  first(1),
  second(2),
  third(3),
  fourth(4),
  fifth(5);

  final int value;

  const Gear(this.value);
}

enum Direction {
  forward,
  stand,
  back,
}

class Car {
  bool _isEngineOn = false;
  Gear _gear = Gear.neutral;
  int _speed = 0;
  Map<Gear, (int, int)> _gearInfo = {};

  bool get isEngineOn => _isEngineOn;
  Gear get gear => _gear;
  int get speed => _speed;

  Car() {
    _gearInfo.addAll({
      Gear.reverse: (0, 20),
      Gear.neutral: (-20, 150),
      Gear.first: (0, 30),
      Gear.second: (20, 50),
      Gear.third: (30, 60),
      Gear.fourth: (40, 90),
      Gear.fifth: (50, 150),
    });
  }

  void turnOnEngine() {
    if (_isEngineOn) throw Exception('Engine is already on');
    _isEngineOn = true;
  }

  void turnOffEngine() {
    if (!_isEngineOn) throw Exception('The engine is already off');

    bool isCarMoving = _speed > 0 || _gear != Gear.neutral;
    if (isCarMoving) throw Exception('Сar must be stopped and in neutral gear');

    _isEngineOn = false;
  }

  void setGear(Gear gear) {
    if (!_isEngineOn) throw Exception('Сan`t set gear while engine is off');

    if (!_isValidRangeOfCurrentSpeed(gear, _speed)) throw Exception('Unsuitable current speed');

    _gear = gear;
  }

  void setSpeed(int speed) {
    if (!_isEngineOn) throw Exception('Cannot set speed while engine is off');

    if (speed < 0) throw Exception('Speed cannot be negative');

    if (!_isValidRangeOfCurrentSpeed(_gear, speed)) throw Exception('Unsuitable current speed');

    bool canSetNewSpeedOnNeutral =
        _gear == Gear.neutral && _speed.abs() < speed;
    if (canSetNewSpeedOnNeutral) throw Exception('Can`t accelerate on neutral');

    _speed = speed;
  }

  Direction getDirection() {
    if (_speed == 0) return Direction.stand;

    return (_gear == Gear.reverse) ? Direction.back : Direction.forward;
  }

  bool _isValidRangeOfCurrentSpeed(Gear gear, int speed) {
    final range = _gearInfo[gear];
    if (range == null) return false;
    final (minSpeed, maxSpeed) = range;
    return speed >= minSpeed && speed <= maxSpeed;
  }
}