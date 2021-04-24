import 'package:flutter/material.dart';



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

  static bool isLandScape;
  static bool isTab;
  
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    isLandScape=_mediaQueryData.orientation==Orientation.landscape ? true:false;
    isTab=_mediaQueryData.size.aspectRatio >= 0.74 && _mediaQueryData.size.aspectRatio < 1.5 ? true :false;

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
ShapeBorder shapeborder=RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  );
var emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xff1367b8),
  primaryColorLight: const Color(0xffC5CAE9),
  primaryColorDark: const Color(0xff303F9F),
  accentColor: Colors.lightBlueAccent,
  shadowColor: Colors.black,
  dividerColor: const Color(0xffBDBDBD),
  scaffoldBackgroundColor: Colors.white,
  primaryTextTheme: TextTheme(
    headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    headline5: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

    bodyText1: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  ),
  fontFamily: 'Roboto',
);

final starsActivationColor = const Color(0xffffaa00);

final starsDeactivationColor = const Color(0xff8C8C98);

final activationColor =const Color(0xFF0288D1);

final deactivatedColor = const Color(0xFF757575);

final validateColor =const Color(0xFF76FF03);

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
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
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
        buttonTheme: ButtonThemeData(
            buttonColor: const Color(0xff3f72af),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))));
  }
}
