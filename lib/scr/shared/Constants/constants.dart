import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static bool isLandScape;
  static bool isTab;

  static void init() {
    screenWidth = Get.width;
    screenHeight = Get.height;
    screenWidth = Get.mediaQuery.size.width;
    screenHeight = Get.mediaQuery.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    isLandScape =
        Get.mediaQuery.orientation == Orientation.landscape ? true : false;
    isTab = Get.mediaQuery.size.aspectRatio >= 0.74 &&
            Get.mediaQuery.size.aspectRatio < 1.5
        ? true
        : false;

    _safeAreaHorizontal =
        Get.mediaQuery.padding.left + Get.mediaQuery.padding.right;
    _safeAreaVertical =
        Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

var emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

final starsActivationColor = const Color(0xffffaa00);

final starsDeactivationColor = const Color(0xff8C8C98);

final activationColor = const Color(0xFF0288D1);

final deactivatedColor = const Color(0xFF757575);

final validateColor = const Color(0xFF76FF03);

class Themes {
  static ThemeData get mainTheme {
    return ThemeData(
        primaryColor: const Color(0xff3f72af),
        primaryColorLight: const Color(0xffdbe2ef),
        primaryColorDark: const Color(0xff112d4e),
        accentColor: Colors.teal[600],
        shadowColor: Colors.black,
        dividerColor: const Color(0xffBDBDBD),
        scaffoldBackgroundColor: Colors.white,
        primaryTextTheme: TextTheme(
          headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            headline3: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            headline4: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            subtitle1: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold)),
        fontFamily: 'Montserrat',
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(12.0),
            hintStyle: TextStyle(color: Colors.white),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: const Color(0xffff6d6f))),
            errorStyle: TextStyle(color: const Color(0xffff6d6f))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          animationDuration: Duration(milliseconds: 300),
          elevation: MaterialStateProperty.all<double>(15.0),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff3f72af)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        )));
  }
}
