import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

const textInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(12.0),
  hintStyle: TextStyle(color: Colors.white),
  errorStyle: TextStyle(color: const Color(0xffff6d6f)),
);

var emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xff1367b8),
  primaryColorLight: const Color(0xffC5CAE9),
  primaryColorDark: const Color(0xff303F9F),
  accentColor: const Color(0xfff48b34),
  shadowColor: Colors.black,
  dividerColor: const Color(0xffBDBDBD),
  primaryTextTheme: TextTheme(
    headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
    headline2: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
    headline3: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  ),
  fontFamily: 'Nunito',
);
