import 'package:flutter/material.dart';

abstract class TextStyles {
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

  static const h1 = TextStyle(fontWeight: FontWeight.w700, fontSize: 27);
  static const h2 = TextStyle(fontWeight: FontWeight.w700, fontSize: 24);
  static const h3 = TextStyle(fontWeight: FontWeight.w700, fontSize: 20);
  static const h4 = TextStyle(fontWeight: FontWeight.w700, fontSize: 17);
  static const h5 = TextStyle(fontSize: 15.5, fontWeight: FontWeight.w400);
  static const h6 = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  static const subtitle =
      TextStyle(fontSize: 13, fontWeight: FontWeight.normal);
  static const body1 = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

  // static final lightTextTheme = Typography.material2018(
  //     platform:
  //     Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
  //     .black
  //     .merge(TextTheme(
  //   headline1: TextStyle(fontFamily: 'Montserrat'),
  //   headline2: TextStyle(fontFamily: 'Montserrat'),
  //   headline3: TextStyle(fontFamily: 'Montserrat'),
  //   headline4: TextStyle(fontFamily: 'Montserrat'),
  //   headline5: TextStyle(fontFamily: 'Montserrat'),
  //   headline6: TextStyle(fontFamily: 'Montserrat'),
  //   subtitle1: TextStyle(fontFamily: 'Montserrat'),
  //   subtitle2: TextStyle(fontFamily: 'Montserrat'),
  //   caption: TextStyle(fontFamily: 'Montserrat'),
  //   bodyText2:
  //   TextStyle(fontFamily: 'Lato', fontSize: 14, letterSpacing: 0.25),
  //   bodyText1:
  //   TextStyle(fontFamily: 'Lato', fontSize: 16, letterSpacing: 0.5),
  //   button: TextStyle(fontFamily: 'Montserrat'),
  //   overline: TextStyle(fontFamily: 'Montserrat'),
  // ));
  //
  // static final darkTextTheme = Typography.material2018(
  //     platform:
  //     Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android)
  //     .white
  //     .merge(TextTheme(
  //   headline1: TextStyle(fontFamily: 'Montserrat'),
  //   headline2: TextStyle(fontFamily: 'Montserrat'),
  //   headline3: TextStyle(fontFamily: 'Montserrat'),
  //   headline4: TextStyle(fontFamily: 'Montserrat'),
  //   headline5: TextStyle(fontFamily: 'Montserrat'),
  //   headline6: TextStyle(fontFamily: 'Montserrat'),
  //   subtitle1: TextStyle(fontFamily: 'Montserrat'),
  //   subtitle2: TextStyle(fontFamily: 'Montserrat'),
  //   caption: TextStyle(fontFamily: 'Montserrat'),
  //   bodyText2:
  //   TextStyle(fontFamily: 'Lato', fontSize: 14, letterSpacing: 0.25),
  //   bodyText1:
  //   TextStyle(fontFamily: 'Lato', fontSize: 16, letterSpacing: 0.5),
  //   button: TextStyle(fontFamily: 'Montserrat'),
  //   overline: TextStyle(fontFamily: 'Montserrat'),
  // ));

}
