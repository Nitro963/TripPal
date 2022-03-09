import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/services.dart';
import 'app/core/values.dart';
import 'app/routes/app_pages.dart';

Future<void> initializeDependencies() async {
  await GetStorage.init();
  await Future.wait([
    LocalizationService.initialize(),
    NotificationService.initialize(),
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
            locale: LocalizationService.instance.currentLocale,
            localizationsDelegates: const [
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialBinding: BindingsBuilder(() {
              Get.put(ThemeControl());
              Get.put(GetWidgetBuilder());
              FlutterNativeSplash.remove();
            }),
            builder: (context, child) {
              ScreenUtil.init(
                BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height),
                context: context,
                designSize: const Size(375.0, 812.0),
              );
              return Obx(
                () => Theme(
                  data: Get.find<ThemeControl>().currentTheme,
                  child: child!,
                ),
              );
            },
          ),
        ),
        blocObserver: ErrorReportingService(),
      );
    },
  );
}
