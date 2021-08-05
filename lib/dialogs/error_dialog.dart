import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

class TimeoutDialog extends StatelessWidget {
  const TimeoutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorDialog(
        handlerModel: ErrorHandlerModel(
            header: "No Internet!",
            message: "Please check your internet connection",
            headerIcon: MdiIcons.wifiOff));
  }
}

class ErrorDialog extends StatelessWidget {
  final ErrorHandlerModel handlerModel;
  const ErrorDialog({Key? key, required this.handlerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return Dialog(
      child: Container(
          padding: Spacing.only(top: 16, bottom: 16, left: 24, right: 24),
          decoration: new BoxDecoration(
            color: themeData.backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: buildErrorContent(handlerModel)),
    );
  }
}
