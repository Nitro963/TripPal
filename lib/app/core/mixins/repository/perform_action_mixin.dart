abstract class Action {}

mixin PerformActionMixin<T> {
  Future<T> performAction(covariant Action action);
}
