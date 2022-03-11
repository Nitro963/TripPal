abstract class Action {}

mixin PerformActionMixin<T> {
  Future<T> performAction(Action action);
}
