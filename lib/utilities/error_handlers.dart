//
// import 'dart:async';
// import 'dart:developer' as developer;
//
// import 'package:get/get.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:production_management/dialogs/error_dialog.dart';
// import 'package:production_management/services/auth_service.dart';
// import 'package:synchronized/synchronized.dart';
// import 'package:dio/dio.dart' as dio;
//
// import 'helpers.dart';
//
// var lock = new Lock();
// var popupRes;
//
// void _handel(error, callback, dialog) {
//   if (!lock.locked)
//     lock.synchronized(
//           () => Future.delayed(Duration(milliseconds: 150), () async {
//         return await Get.dialog(dialog);
//       })
//         ..then((value) {
//           popupRes = value;
//           if (value != null) {
//             callback();
//           }
//         }),
//     );
//   else {
//     lock.synchronized(() {
//       if (popupRes != null) callback();
//     });
//   }
// }
//
// // TODO
// void handelDioResponseError(dio.DioError error, callback) {
//   assert(error.type == dio.DioErrorType.response);
//   switch (error.response!.statusCode) {
//     case 401:
//       Get.find<AuthControl>().onUnauthorizedError();
//       break;
//   }
// }
//
// void _defaultHandler(error, callback) {
//   _handel(
//     error,
//     callback,
//     ErrorDialog(
//       handlerModel: describeError(error, () {
//         Get.back(result: true);
//       }),
//     ),
//   );
// }
//
// void handelError(error, callback) {
//   if (error is dio.DioError) {
//     if (error.type == dio.DioErrorType.response) {
//       handelDioResponseError(error, callback);
//       return;
//     }
//     _defaultHandler(error, callback);
//   } else {
//     _defaultHandler(error, callback);
//   }
// }
