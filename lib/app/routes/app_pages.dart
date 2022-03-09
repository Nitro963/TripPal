import 'package:get/get.dart';

import '../core/middlewares.dart';
import '../modules/boarding/bindings/boarding_binding.dart';
import '../modules/boarding/views/boarding_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const INITIAL = Routes.BOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.BOARDING,
        page: () => const BoardingView(),
        binding: BoardingBinding(),
        middlewares: [
          BoardingMiddleWare(),
        ]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
