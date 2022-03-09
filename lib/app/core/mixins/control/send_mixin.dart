import '../repository/perform_action_mixin.dart';

mixin SendMixin<T> {
  set inAsyncCall(bool value);

  PerformActionMixin<T> get repository;

  Future<T> sendItem(Action action, {bool chained = false}) async {
    try {
      inAsyncCall = true;
      return await repository.performAction(action);
    } finally {
      if (!chained) inAsyncCall = false;
    }
  }
}
