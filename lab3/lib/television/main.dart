import 'tv_controller.dart';
import 'event_loop.dart';
import 'television.dart';

void main() {
  try {
    Television television = new Television();
    TvController controller = new TvController(television);
    EventLoop eventLoop = new EventLoop(controller);
    eventLoop.run();
  } catch (e) {
    print(e.toString());
  }
}