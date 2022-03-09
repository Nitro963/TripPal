import 'package:get/get.dart';

import '../blocs/home_cubit.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeCubit>(
      () => HomeCubit(),
    );
  }
}
