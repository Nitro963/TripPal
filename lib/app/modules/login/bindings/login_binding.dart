import 'package:get/get.dart';

import '../../../core/generics.dart';
import '../blocs/login_cubit.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginCubit>(
      () => LoginCubit(),
    );
    Get.lazyPut(() => InAsyncCallBloc());
  }
}
