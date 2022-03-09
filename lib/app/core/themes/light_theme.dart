import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/decorations.dart';
import 'text_theme.dart';

abstract class LightTheme {
  static ThemeData build(String languageCode) {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.blueOcean,
      errorColor: AppColors.redVelvet,
      scaffoldBackgroundColor: AppColors.pureWhite,
      appBarTheme: AppBarTheme(
        color: AppColors.pureWhite,
        elevation: 2,
        titleTextStyle: AppTextTheme.buildAppBarTitleStyle(languageCode),
        iconTheme: const IconThemeData(
          color: AppColors.navyBlack,
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.blueOcean,
        primaryContainer: AppColors.orangeFresh,
        secondary: AppColors.earthGreen,
        secondaryContainer: AppColors.redVelvet,
        tertiary: AppColors.navyBlack,
        tertiaryContainer: AppColors.pureWhite,
        surface: AppColors.darkGrey,
        onSurface: AppColors.halfGrey,
      ),
      textTheme: AppTextTheme.build(languageCode),
      cardTheme: const CardTheme(
        shape: Decorations.CARD_SHAPE,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.offGrey,
        hintStyle: TextStyle(color: AppColors.halfGrey),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
        focusedBorder: Decorations.kInputBorder,
        errorBorder: Decorations.kInputErrorBorder,
        focusedErrorBorder: Decorations.kInputErrorBorder,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: AppTextTheme.buildElevatedButtonTextStyle(languageCode),
            shape: Decorations.ELEVATED_BUTTON_SHAPE,
            elevation: 8),
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          textTheme: AppTextTheme.buildCupertinoTextTheme(languageCode)),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: AppColors.pureWhite,
        elevation: Decorations.ELEVATED_BUTTON_ROUND_RADIUS,
      ),
    );
  }
}
