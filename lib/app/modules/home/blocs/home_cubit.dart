import '../../../core/bases.dart';
import '../../../core/generics.dart';

class HomeCubit extends BaseCubit<DataReadyState<int>> {
  HomeCubit() : super(DataReadyState<int>(0));

  void increment() => emit(DataReadyState(state.data + 1));
}
