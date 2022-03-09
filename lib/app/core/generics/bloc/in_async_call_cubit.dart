import '../../../core/control_mixins.dart';
import '../../abstract/bloc/base_cubit.dart';

class InAsyncCallBloc extends BaseCubit<bool> with InAsyncCallMixin {
  InAsyncCallBloc() : super(false);

  @override
  bool get inAsyncCall => state;

  @override
  set inAsyncCall(bool value) => emit(value);
}
