import 'package:flutter/material.dart';

import 'text_theme.dart';

abstract class DarkTheme {
  static ThemeData build(String languageCode) {
    // TODO implement dark theme
    return ThemeData.dark().copyWith(
      textTheme:
          AppTextTheme.build(languageCode).apply(bodyColor: Colors.white),
    );
  }
}
