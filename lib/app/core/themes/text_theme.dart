import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../values/colors.dart';

abstract class AppTextTheme {
  static TextTheme build(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return GoogleFonts.cairoTextTheme()
            .apply(bodyColor: AppColors.navyBlack);
      default:
        return GoogleFonts.dmSansTextTheme()
            .apply(bodyColor: AppColors.navyBlack);
    }
  }

  static TextStyle buildElevatedButtonTextStyle(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 19);
      default:
        return GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: 19);
    }
  }

  static CupertinoTextThemeData buildCupertinoTextTheme(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return CupertinoTextThemeData(
          textStyle: GoogleFonts.cairo(),
        );
      default:
        return CupertinoTextThemeData(textStyle: GoogleFonts.dmSans());
    }
  }

  static TextStyle buildAppBarTitleStyle(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return GoogleFonts.cairo(
            color: AppColors.blueOcean,
            fontWeight: FontWeight.w700,
            fontSize: 18);
      default:
        return GoogleFonts.dmSans(
            color: AppColors.blueOcean,
            fontWeight: FontWeight.w700,
            fontSize: 18);
    }
  }
}
