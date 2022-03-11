import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

import '../../../generated/codegen_loader.g.dart';
import '../values/config.dart';
import '../values/storage_keys.dart';

class LocalizationService extends ValueNotifier<int> {
  final box = GetStorage();

  late final EasyLocalizationController _ezController;

  LocalizationService._internal({int? localeID})
      : super(localeID ??
            GetStorage().read<int>(StorageKeys.LOCALE_ID) ??
            Config.DEFAULT_LOCALE_ID);

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

  Locale get currentLocale => Config.SUPPORTED_LOCALES[value];
  int get currentLocaleID => value;
  List<Locale> get supportedLocale => Config.SUPPORTED_LOCALES;
  Locale get fallbackLocale => Config.FALLBACK_LOCALE;

  Future<void> updateLocale(int localeID) async {
    await _ezController.setLocale(Config.SUPPORTED_LOCALES[localeID]);
    box.write(StorageKeys.LOCALE_ID, localeID);
    Localization.load(_ezController.locale,
        translations: _ezController.translations,
        fallbackTranslations: _ezController.fallbackTranslations);
    value = localeID;
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

class LocalizationsBuilder extends StatefulWidget {
  const LocalizationsBuilder({Key? key, this.builder}) : super(key: key);
  final Widget Function(BuildContext)? builder;
  @override
  _LocalizationsBuilderState createState() => _LocalizationsBuilderState();
}

class _LocalizationsBuilderState extends State<LocalizationsBuilder> {
  @override
  void initState() {
    LocalizationService.instance.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: LocalizationService.instance.currentLocale,
      delegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      child: widget.builder?.call(context),
    );
  }
}
