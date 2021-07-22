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

  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        // canvasColor: const Color(0xffdbe2ef),
        unselectedWidgetColor: Colors.blue[800],
        primaryColor: const Color(0xff3f72af),
        primaryColorLight: const Color(0xffdbe2ef),
        primaryColorDark: const Color(0xff112d4e),
        accentColor: Colors.teal[600],
        shadowColor: Colors.black,
        dividerColor: const Color(0xffBDBDBD),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        primaryTextTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22,
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            headline3: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            headline4: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.bold),
            bodyText2: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.normal)),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            headline3: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            headline4: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.bold),
            bodyText2: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.normal),
            subtitle1: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.bold)),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(12.0),
            hintStyle: TextStyle(color: Colors.grey[500]),
            errorBorder: UnderlineInputBorder()),
        errorColor: const Color(0xffff6d6f),
        splashColor: Colors.grey.shade300,
        indicatorColor: Colors.white,
        disabledColor: Color(0xffdcc7ff),
        highlightColor: Colors.white,
        cardColor: Colors.white,
        colorScheme: ColorScheme.light(
            primary: const Color(0xff3f72af),
            onPrimary: Colors.white,
            secondary: Color(0xff495057),
            secondaryVariant: Color(0xff3cd278),
            onSecondary: Colors.white,
            surface: Color(0xffe2e7f1),
            background: Colors.white,
            onBackground: Colors.black87),

        // textButtonTheme: TextButtonThemeData(
        //     style: ButtonStyle(
        //       animationDuration: Duration(milliseconds: 300),
        //       elevation: MaterialStateProperty.all<double>(15.0),
        //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[800]!),
        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //           RoundedRectangleBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        //     )),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            animationDuration: Duration(milliseconds: 300),
            elevation: MaterialStateProperty.all<double>(15.0),
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff3f72af)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          ),
        ),
        appBarTheme: AppBarTheme(color: const Color(0xff3f72af)),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Color(0xff495057),
          labelColor: Color(0xff3d63ff),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shadowColor: Colors.black.withOpacity(0.4),
          elevation: 1,
          margin: EdgeInsets.all(0),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff3d63ff),
            splashColor: Colors.white.withAlpha(100),
            highlightElevation: 8,
            elevation: 4,
            focusColor: Color(0xff3d63ff),
            hoverColor: Color(0xff3d63ff),
            foregroundColor: Colors.white),
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
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        // canvasColor: Color(0xff464c52),
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
          color: Colors.white,
        ),
        primaryTextTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.bold),
          headline3: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold),
          headline4: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.normal),
        ),
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            subtitle1: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        fontFamily: 'Montserrat',
        indicatorColor: Colors.white,
        disabledColor: Color(0xffa3a3a3),
        highlightColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(12.0),
            hintStyle: TextStyle(color: Colors.white),
            errorBorder: UnderlineInputBorder()),
        // textButtonTheme: TextButtonThemeData(
        //     style: ButtonStyle(
        //   animationDuration: Duration(milliseconds: 300),
        //   elevation: MaterialStateProperty.all<double>(15.0),
        //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[800]!),
        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //       RoundedRectangleBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        // )),
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
}
