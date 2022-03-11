import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:untitled/app/core/services.dart';
import 'package:untitled/app/core/values.dart';

import 'app/core/themes.dart';
import 'app/routes/app_pages.dart';

Future<void> initializeDependencies() async {
  await GetStorage.init();
  await Future.wait([
    LocalizationService.initialize(),
    NotificationService.initialize(),
    ThemeService.initialize(themeBuilders: [
      LightTheme.build,
      DarkTheme.build,
    ]),
    FCMService.initialize(),
  ]);
}

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await initializeDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      BlocOverrides.runZoned(
        () => runApp(
          GetMaterialApp(
            title: Environment.APP_TITLE,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            initialBinding: BindingsBuilder(() {
              Get.put(GetWidgetBuilder());
              FlutterNativeSplash.remove();
            }),
            builder: (context, child) {
              ScreenUtil.init(
                BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                context: context,
                designSize: const Size(375.0, 812.0),
              );
              return LocalizationsBuilder(
                builder: (context) =>
                    ThemeBuilder(builder: (context) => child!),
              );
            },
          ),
        ),
        blocObserver: ErrorReportingService(),
      );
    },
  );
}
