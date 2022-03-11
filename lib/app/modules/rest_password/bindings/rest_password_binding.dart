import 'package:get/get.dart';

import '../../../core/generics.dart';
import '../blocs/rest_password_cubit.dart';

class RestPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestPasswordCubit>(
      () => RestPasswordCubit(),
    );
    Get.lazyPut(() => InAsyncCallBloc());
  }
}
