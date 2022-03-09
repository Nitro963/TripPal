import 'package:flutter/painting.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../generated/codegen_loader.g.dart';
import '../values/config.dart';
import '../values/storage_keys.dart';

class LocalizationService {
  final box = GetStorage();
  int _localeID;
  late final EasyLocalizationController _ezController;

  LocalizationService._internal({int? localeID})
      : _localeID = localeID ??
            GetStorage().read<int>(StorageKeys.LOCALE_ID) ??
            Config.DEFAULT_LOCALE_ID;

  static LocalizationService? _instance;

  static LocalizationService get instance {
    return _instance!;
  }

  static Future<void> initialize() async {
    if (_instance != null) return;

    _instance = LocalizationService._internal();

    await EasyLocalizationController.initEasyLocation();

    final controller = EasyLocalizationController(
      saveLocale: false,
      startLocale: _instance!.currentLocale,
      fallbackLocale: _instance!.fallbackLocale,
      supportedLocales: _instance!.supportedLocale,
      assetLoader: const CodegenLoader(),
      useOnlyLangCode: false,
      useFallbackTranslations: true,
      path: 'assets/locale',
      onLoadError: (e) {},
    );

    //Load translations from assets
    await controller.loadTranslations();

    _instance!._ezController = controller;

    //load translations into exploitable data, kept in memory
    Localization.load(controller.locale,
        translations: controller.translations,
        fallbackTranslations: controller.fallbackTranslations);
  }

  Locale get currentLocale => Config.SUPPORTED_LOCALES[_localeID];
  int get currentLocaleID => _localeID;
  List<Locale> get supportedLocale => Config.SUPPORTED_LOCALES;
  Locale get fallbackLocale => Config.FALLBACK_LOCALE;

  Future<void> updateLocale(int localeID) async {
    _localeID = localeID;
    await _ezController.setLocale(currentLocale);
    box.write(StorageKeys.LOCALE_ID, localeID);
    Localization.load(_ezController.locale,
        translations: _ezController.translations,
        fallbackTranslations: _ezController.fallbackTranslations);
    Get.updateLocale(currentLocale);
  }

  String tr(
    String key, {
    List<String>? args,
    String? gender,
  }) {
    return Localization.instance.tr(key, args: args, gender: gender);
  }

  String plural(String key, num value,
      {List<String>? args, NumberFormat? format}) {
    return Localization.instance.plural(key, value, args: args, format: format);
  }
}
