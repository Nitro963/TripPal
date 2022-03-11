import 'package:get/get.dart';

import '../blocs/register_blocs.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCubit>(
      () => RegisterCubit(),
    );
  }
}
