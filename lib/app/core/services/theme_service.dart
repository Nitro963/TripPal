import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';

import '../values/storage_keys.dart';

class ThemeService extends ValueNotifier {
  final box = GetStorage();

  final List<ThemeData Function(String langaugeCode)> themeBuilders;

  int get themeMode => value;

  ThemeService._internal({int? themeMode, required this.themeBuilders})
      : super(themeMode ?? GetStorage().read<int>(StorageKeys.THEME_MODE) ?? 0);

  static ThemeService? _instance;

  static ThemeService get instance {
    return _instance!;
  }

  static Future<void> initialize(
      {int? themeMode,
      required List<ThemeData Function(String langaugeCode)>
          themeBuilders}) async {
    assert(themeBuilders.isNotEmpty);
    if (_instance != null) return;

    _instance = ThemeService._internal(
        themeMode: themeMode, themeBuilders: themeBuilders);
  }

  Future<void> updateTheme(int themeMode) async {
    value = themeMode;
    return box.write(StorageKeys.THEME_MODE, themeMode);
  }

  ThemeData build(BuildContext context) {
    return themeBuilders[themeMode]
        .call(Localizations.localeOf(context).languageCode);
  }
}

class ThemeBuilder extends StatefulWidget {
  const ThemeBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext) builder;
  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  @override
  void initState() {
    ThemeService.instance.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeService.instance.build(context),
      child: widget.builder(context),
    );
  }
}
