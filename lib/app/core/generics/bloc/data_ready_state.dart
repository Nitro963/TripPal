import '../../abstract/bloc/base_state.dart';

class DataReadyState<T> extends BaseState {
  final T data;

  DataReadyState(this.data);

  @override
  DataReadyState copyWith(Map<String, dynamic> data) =>
      DataReadyState(data['data'] ?? this.data);
}
