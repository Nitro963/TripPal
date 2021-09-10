import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trip_pal_null_safe/controllers/apps_controllers.dart';
import 'package:trip_pal_null_safe/pages.dart';
import 'package:trip_pal_null_safe/screens/boarding/boarding.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/services/firebase_service.dart';
import 'package:trip_pal_null_safe/services/geocoding_service.dart';
import 'package:trip_pal_null_safe/services/notification_service.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';
import 'package:trip_pal_null_safe/services/weather_service.dart';

import 'controllers/app_theme_controller.dart';
import 'controllers/trips_list_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMemory();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(await buildApp());
  });
}

Future<void> initMemory() async {
  await GetStorage.init();
  final box = GetStorage();
  box.writeIfNull('themeMode', 1);
  box.writeIfNull('language', 'en');
  box.writeIfNull('country', 'US');
  box.writeIfNull('boarding', true);
  BoardingController.boarding = box.read('boarding');
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenWeatherMap());
    Get.lazyPut(() => GeoCodingService());
    Get.lazyPut(() => BackendService());
    Get.lazyPut(() => AuthControl());
    Get.lazyPut(() => TripsListController());
  }
}

Future<GetMaterialApp> buildApp() async {
  await NotificationService.initialize();
  FCMService.initialize();
  final box = GetStorage();
  final controller = Get.put(AppThemeController(box.read('themeMode')));
  final themeMode = controller.themeMode;
  final language = box.read('language')!;
  final country = box.read('country')!;
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.fromThemeMode(themeMode),
    initialRoute: '/loading',
    initialBinding: InitialBindings(),
    locale: Locale(language, country),
    // translations: AppTranslations(),
    getPages: pages,
  );
}
