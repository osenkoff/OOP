import './strategy/action_strategy.dart';

class Actions {
  List<double> selectAction({
    required String actionNumber,
    required List<double> receivedArray,
  }) {
    ActionStrategy variant = getVariant(actionNumber);
    final result = variant.execute(receivedArray);

    return result;
  }
}
