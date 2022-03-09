import '../../abstract/bloc/base_state.dart';

class ErrorState<T> extends BaseState {
  final T error;

  ErrorState(this.error);

  @override
  ErrorState copyWith(Map<String, dynamic> data) =>
      ErrorState(data['error'] ?? error);
}
