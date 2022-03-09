import 'package:get/get.dart';

import '../blocs/boarding_bloc.dart';

class BoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardingCubit>(
      () => BoardingCubit(),
    );
  }
}
