import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:synchronized/synchronized.dart';
import 'package:trip_pal_null_safe/dialogs/error_dialog.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

var lock = new Lock();
var popupRes;

void _showDialog(callback, dialog) {
  if (!lock.locked)
    lock.synchronized(
      () => Future.delayed(Duration(milliseconds: 150), () async {
        return await Get.dialog(dialog);
      })
        ..then((value) {
          popupRes = value;
          if (value != null) {
            callback();
          }
        }),
    );
  else {
    lock.synchronized(() {
      if (popupRes != null) callback();
    });
  }
}

void _defaultHandler(error, callback, {closeCallBack: false}) {
  _showDialog(
    callback,
    ErrorDialog(
      handlerModel: ErrorHandlerModel.fromError(error, () {
        Get.back(result: true);
      }, closeCallBack: closeCallBack),
    ),
  );
}

void handelError(error, callback, {closeCallBack: false}) {
  if (error is dio.DioError) {
    if (error.type == dio.DioErrorType.response) {
      switch (error.response!.statusCode) {
        case 401:
          Get.find<AuthControl>().onUnauthorizedError();
          return;
      }
    }
  }
  _defaultHandler(error, callback, closeCallBack: closeCallBack);
}
