import 'package:lab3/car/car.dart';
import 'package:lab3/car/car_controller.dart';
import 'package:lab3/car/event_loop.dart';

void main() {
  try {
    Car car = new Car();
    CarController controller = new CarController(car);
    EventLoop eventLoop = new EventLoop(controller);
    eventLoop.run();
  } catch (e) {
    print(e.toString());
  }
}
