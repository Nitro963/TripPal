import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final starsActivationColor = const Color(0xffffaa00);

final starsDeactivationColor = const Color(0xff8C8C98);

final activationColor = const Color(0xFF0288D1);

final deactivatedColor = const Color(0xFF757575);

final kCardTitle = TextStyle(
  fontSize: 26.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontFamily: 'Patrick',
);

final kFiltersSubTitle =
    TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.bold);

final kFieldTitle = TextStyle(
    fontFamily: 'Patrick',
    fontSize: 18,
    color: Colors.black.withOpacity(0.8),
    fontWeight: FontWeight.bold);

final kPrimaryFiltersTitleStyle =
    TextStyle(fontFamily: 'Lato', fontSize: 25.0, fontWeight: FontWeight.bold);

final kSecondaryFiltersTitleStyle = TextStyle(
  fontFamily: 'Lato',
  fontSize: 18.0,
);

class Themes {
  static int get lightMode => 1;

  static int get darkMode => 2;

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  /// headline2    60.0  light   -0.5
  /// headline3    48.0  regular  0.0
  /// headline4    34.0  regular  0.25
  /// headline5    24.0  regular  0.0
  /// headline6    20.0  medium   0.15
  /// subtitle1    16.0  regular  0.15
  /// subtitle2    14.0  medium   0.1
  /// body1        16.0  regular  0.5   (bodyText1)
  /// body2        14.0  regular  0.25  (bodyText2)
  /// button       14.0  medium   1.25
  /// caption      12.0  regular  0.4
  /// overline     10.0  regular  1.5

  static final lightTextTheme = Typography.material2018(
          platform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
      .black
      .merge(TextTheme(
        headline1: TextStyle(fontFamily: 'Montserrat'),
        headline2: TextStyle(fontFamily: 'Montserrat'),
        headline3: TextStyle(fontFamily: 'Montserrat'),
        headline4: TextStyle(fontFamily: 'Montserrat'),
        headline5: TextStyle(fontFamily: 'Montserrat'),
        headline6: TextStyle(fontFamily: 'Montserrat'),
        subtitle1: TextStyle(fontFamily: 'Montserrat'),
        subtitle2: TextStyle(fontFamily: 'Montserrat'),
        caption: TextStyle(fontFamily: 'Montserrat'),
        bodyText2: TextStyle(fontFamily: 'Lato'),
        bodyText1: TextStyle(fontFamily: 'Lato'),
        button: TextStyle(fontFamily: 'Montserrat'),
        overline: TextStyle(fontFamily: 'Montserrat'),
      ));

  static final darkTextTheme = Typography.material2018(
          platform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
      .white
      .merge(TextTheme(
        headline1: TextStyle(fontFamily: 'Montserrat'),
        headline2: TextStyle(fontFamily: 'Montserrat'),
        headline3: TextStyle(fontFamily: 'Montserrat'),
        headline4: TextStyle(fontFamily: 'Montserrat'),
        headline5: TextStyle(fontFamily: 'Montserrat'),
        headline6: TextStyle(fontFamily: 'Montserrat'),
        subtitle1: TextStyle(fontFamily: 'Montserrat'),
        subtitle2: TextStyle(fontFamily: 'Montserrat'),
        caption: TextStyle(fontFamily: 'Montserrat'),
        bodyText2: TextStyle(fontFamily: 'Lato'),
        bodyText1: TextStyle(fontFamily: 'Lato'),
        button: TextStyle(fontFamily: 'Montserrat'),
        overline: TextStyle(fontFamily: 'Montserrat'),
      ));

  static ThemeData get lightTheme {
    return ThemeData(
      // canvasColor: Colors.lightBlue[50],
      brightness: Brightness.light,
      primaryColor: Color(0xff3d63ff),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      navigationRailTheme: NavigationRailThemeData(
          selectedIconTheme:
              IconThemeData(color: Color(0xff3d63ff), opacity: 1, size: 24),
          unselectedIconTheme:
              IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
          backgroundColor: Color(0xffffffff),
          elevation: 3,
          selectedLabelTextStyle: TextStyle(color: Color(0xff3d63ff)),
          unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
      colorScheme: ColorScheme.light(
          primary: Color(0xff3d63ff),
          onPrimary: Colors.white,
          primaryVariant: Color(0xff0055ff),
          secondary: Color(0xff495057),
          secondaryVariant: Color(0xff3cd278),
          onSecondary: Colors.lightBlue[800]!,
          surface: Color(0xffe2e7f1),
          background: Color(0xfff3f4f7),
          onBackground: Color(0xff495057)),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.4),
        elevation: 1,
        margin: EdgeInsets.all(0),
      ),
      inputDecorationTheme:
          InputDecorationTheme(hintStyle: TextStyle(color: Color(0xaa495057))),
      splashColor: Colors.grey.shade300,
      iconTheme: IconThemeData(
        color:  Color(0xff3d63ff),
      ),
      appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Color(0xff495057),
        ),
        color: Color(0xffffffff),
        iconTheme: IconThemeData(color: Color(0xff495057), size: 24),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        animationDuration: Duration(milliseconds: 300),
        elevation: MaterialStateProperty.all<double>(15.0),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff3f72af)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)))),
      )),
      primaryTextTheme: lightTextTheme,
      textTheme: lightTextTheme,
      fontFamily: 'Montserrat',
      indicatorColor: Colors.white,
      disabledColor: Color(0xffdcc7ff),
      highlightColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff3d63ff),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: Color(0xff3d63ff),
          hoverColor: Color(0xff3d63ff),
          foregroundColor: Colors.white),
      dividerColor: Color(0xffd1d1d1),
      errorColor: Color(0xfff0323c),
      cardColor: Colors.white,
      accentColor: Color(0xff3d63ff),
      popupMenuTheme: PopupMenuThemeData(
        color: Color(0xffffffff),
        textStyle: lightTextTheme.bodyText2!
            .merge(TextStyle(color: Color(0xff495057))),
      ),
      bottomAppBarTheme:
          BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xff3d63ff),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
        ),
      ),
      
      sliderTheme: SliderThemeData(
        activeTrackColor: Color(0xff3d63ff),
        inactiveTrackColor: Color(0xff3d63ff).withAlpha(140),
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Color(0xff3d63ff),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        // canvasColor: Color(0xff3d63ff),
        primaryColor: Color(0xff3d63ff),
        scaffoldBackgroundColor: Color(0xff464c52),
        backgroundColor: Color(0xff464c52),
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Color(0xffffffff),
          ),
          color: Color(0xff2e343b),
          iconTheme: IconThemeData(color: Color(0xffffffff), size: 24),
        ),
        colorScheme: ColorScheme.dark(
          primary: Color(0xff3d63ff),
          primaryVariant: Color(0xff3d63ff),
          secondary: Color(0xff00cc77),
          secondaryVariant: Color(0xff00cc77),
          background: Color(0xff343a40),
          onPrimary: Colors.white,
          onBackground: Colors.white,
          onSecondary: Colors.white,
          surface: Color(0xff585e63),
        ),
        cardTheme: CardTheme(
          color: Color(0xff37404a),
          shadowColor: Color(0xff000000),
          elevation: 1,
          margin: EdgeInsets.all(0),
        ),
        iconTheme: IconThemeData(
          color: Color(0xffffffff),
        ),
        primaryTextTheme: darkTextTheme,
        textTheme: darkTextTheme,
        fontFamily: 'Montserrat',
        indicatorColor: Colors.white,
        disabledColor: Color(0xffa3a3a3),
        highlightColor: Colors.grey.shade600,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(12.0),
            hintStyle: TextStyle(color: Colors.white),
            errorBorder: UnderlineInputBorder()),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          animationDuration: Duration(milliseconds: 300),
          elevation: MaterialStateProperty.all<double>(15.0),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff3f72af)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        )),
        dividerColor: Color(0xffd1d1d1),
        errorColor: Colors.orange,
        cardColor: Color(0xff282a2b),
        splashColor: Colors.white.withAlpha(100),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff3d63ff),
            splashColor: Colors.white.withAlpha(100),
            highlightElevation: 8,
            elevation: 4,
            focusColor: Color(0xff3d63ff),
            hoverColor: Color(0xff3d63ff),
            foregroundColor: Colors.white),
        accentColor: Color(0xff3d63ff),
        bottomAppBarTheme:
            BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Color(0xff495057),
          labelColor: Color(0xff3d63ff),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
          ),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: Color(0xff3d63ff),
          inactiveTrackColor: Color(0xff3d63ff).withAlpha(100),
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 4.0,
          thumbColor: Color(0xff3d63ff),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          inactiveTickMarkColor: Colors.red[100],
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        cupertinoOverrideTheme: CupertinoThemeData());
  }

  static ThemeData fromThemeMode(int themeMode) {
    switch (themeMode) {
      case 1:
        return lightTheme;
      case 2:
        return darkTheme;
      default:
        return lightTheme;
    }
  }

  static getDetailsAppBarColorFromThemeMode(int themeMode) {
    switch (themeMode) {
      case 1:
        return const Color(0xff3f72af);
      case 2:
        return const Color(0xff2e343b);
    }
  }
}
