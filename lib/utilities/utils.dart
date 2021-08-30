import 'dart:ui';
import 'dart:developer' as developer;

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

bool canPop() {
  return Navigator.of(Get.context!).canPop();
}

TextDirection appCurrentTextDirection() {
  if (isRTL(Get.locale!.languageCode)) return TextDirection.rtl;
  return TextDirection.ltr;
}

bool isRTL(String languageCode) {
  return rtlLanguages.contains(languageCode);
}

GetBar<Object> buildErrorSnackBar(String error,
    {SnackPosition position = SnackPosition.BOTTOM,
    SnackDismissDirection snackDismissDirection =
        SnackDismissDirection.HORIZONTAL,
    margin: const EdgeInsets.only(bottom: 20),
    duration: const Duration(seconds: 2)}) {
  return GetBar(
    snackPosition: position,
    duration: duration,
    messageText: new Text(
      error,
      style: TextStyle(color: Colors.red),
    ),
    icon: Icon(Icons.error, color: Colors.red),
    maxWidth: Get.width * 0.95,
    margin: margin,
    borderRadius: 10,
    dismissDirection: snackDismissDirection,
    leftBarIndicatorColor: Colors.red,
  );
}

class ErrorHandlerModel {
  final String header;
  final String message;
  final Map<String, dynamic> problems;
  final IconData headerIcon;
  final String buttonTitle;
  final Function()? callback;
  ErrorHandlerModel(
      {required this.header,
      required this.message,
      required this.headerIcon,
      this.callback,
      this.buttonTitle = 'TRY AGAIN',
      this.problems = const {}});

  factory ErrorHandlerModel.fromError(error, callback, {closeCallBack: false}) {
    developer.log('Something happened!', name: 'HANDLER_MODEL', error: error);
    if (error is dio.DioError) {
      if (error.type == dio.DioErrorType.connectTimeout) {
        return ErrorHandlerModel(
            header: "No Internet!",
            message: "Please check your internet connection",
            headerIcon: MdiIcons.wifiOff,
            callback: callback);
      }
      if (error.type == dio.DioErrorType.response &&
          400 <= error.response!.statusCode! &&
          error.response!.statusCode! < 500) {
        developer.log(error.response.toString(), name: 'HANDLER_MODEL');
        if (error.response!.statusCode != 404)
          return ErrorHandlerModel(
            header: 'Error',
            headerIcon: MdiIcons.alertCircleOutline,
            message: error.response!.data['message'] ?? '',
            problems: error.response!.data,
            callback: closeCallBack
                ? () {
                    Get.back();
                  }
                : null,
            buttonTitle: closeCallBack ? 'CLOSE' : 'TRY AGAIN',
          );
      }
    }
    return ErrorHandlerModel(
        header: 'Something happened!',
        message: 'Please try again later.',
        headerIcon: MdiIcons.alert,
        callback: callback);
  }
}

Widget buildErrorContent(ErrorHandlerModel handlerModel) {
  final themeData = Get.theme;
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Center(
            child: Icon(
          handlerModel.headerIcon,
          size: 40,
          color: themeData.colorScheme.onBackground.withAlpha(220),
        )),
      ),
      Container(
        margin: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            handlerModel.header,
            style: themeData.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 16),
        child: Center(
            child: Text(handlerModel.message,
                style: themeData.textTheme.caption!
                    .copyWith(fontWeight: FontWeight.w500))),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: handlerModel.problems.entries.map((entry) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.key.capitalizeFirst!.tr + ":",
                    style: themeData.textTheme.subtitle2!
                        .copyWith(fontWeight: FontWeight.w600)),
                Expanded(
                  child: Text(entry.value.toString().tr,
                      style: themeData.textTheme.caption!
                          .copyWith(fontWeight: FontWeight.w500)),
                ),
              ]);
        }).toList(),
      ),
      if (handlerModel.callback != null)
        Container(
          margin: Spacing.only(top: 16),
          child: Center(
            child: ElevatedButton(
                onPressed: handlerModel.callback,
                child: Text(handlerModel.buttonTitle,
                    style: themeData.textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                        color: themeData.colorScheme.onPrimary))),
          ),
        )
    ],
  );
}

/// {@template custom_rect_tween}
/// Linear RectTween with a [Curves.easeOut] curve.
///
/// Less dramatic that the regular [RectTween] used in [Hero] animations.
/// {@endtemplate}
class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    required Rect? begin,
    required Rect? end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, elasticCurveValue)!,
      lerpDouble(begin!.top, end!.top, elasticCurveValue)!,
      lerpDouble(begin!.right, end!.right, elasticCurveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, elasticCurveValue)!,
    );
  }
}

/// {@template hero_dialog_route}
/// Custom [PageRoute] that creates an overlay dialog (popup effect).
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}
