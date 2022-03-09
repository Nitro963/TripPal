import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';
import '../values/config.dart';
import '../values/storage_keys.dart';

class ThemeControl extends GetxService {
  final RxInt _themeMode;

  final box = GetStorage();

  int get themeMode => _themeMode.value;

  ThemeControl({int? themeMode})
      : _themeMode = RxInt(
            themeMode ?? GetStorage().read<int>(StorageKeys.THEME_MODE) ?? 1);

  Future<void> updateTheme(int themeMode) async {
    _themeMode.value = themeMode;
    return box.write(StorageKeys.THEME_MODE, themeMode);
  }

  ThemeData get currentTheme {
    switch (themeMode) {
      case 1:
        return LightTheme.build(
            Get.locale?.languageCode ?? Config.DEFAULT_LANGUAGE_CODE);
      case 2:
        return DarkTheme.build(
            Get.locale?.languageCode ?? Config.DEFAULT_LANGUAGE_CODE);
      default:
        return LightTheme.build(
            Get.locale?.languageCode ?? Config.DEFAULT_LANGUAGE_CODE);
    }
  }
}
