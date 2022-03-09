import 'package:flutter/material.dart';

import 'colors.dart';

abstract class Decorations {
  static const CARD_ROUND_RADIUS = 10.0;
  static const ELEVATED_BUTTON_ROUND_RADIUS = 8.0;

  static const ELEVATED_BUTTON_SHAPE = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(ELEVATED_BUTTON_ROUND_RADIUS),
    ),
  );

  static const CARD_ROUND_BORDER =
      BorderRadius.all(Radius.circular(CARD_ROUND_RADIUS));

  static const CARD_SHAPE = RoundedRectangleBorder(
    borderRadius: CARD_ROUND_BORDER,
  );

  static const _kCredentialsInputDecorationsBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.halfGrey),
  );

  static const _kCredentialsInputDecorationsErrorBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.orangeFresh),
  );

  static const kCredentialsInputDecorations = InputDecoration(
    filled: false,
    hintStyle: TextStyle(color: AppColors.pureWhite),
    errorStyle: TextStyle(color: AppColors.orangeFresh),
    border: _kCredentialsInputDecorationsBorder,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.blueOcean),
    ),
    errorBorder: _kCredentialsInputDecorationsErrorBorder,
    focusedErrorBorder: _kCredentialsInputDecorationsErrorBorder,
    disabledBorder: _kCredentialsInputDecorationsBorder,
    enabledBorder: _kCredentialsInputDecorationsBorder,
  );

  static const kInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: AppColors.blueOcean),
  );

  static const kInputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: AppColors.redVelvet),
  );
}
