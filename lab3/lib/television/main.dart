import 'controller.dart';
import 'event_loop.dart';
import 'television.dart';

void main() {
  try {
    Television television = new Television();
    Controller controller = new Controller(television);
    EventLoop eventLoop = new EventLoop(controller);
    eventLoop.run();
  } catch (e) {
    print(e.toString());
  }
}