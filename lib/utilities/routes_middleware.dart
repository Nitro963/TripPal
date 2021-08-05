import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/screens/boarding/boarding.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';

class GlobalMiddleWare extends GetMiddleware {
  AuthControl get _authorizationService => Get.find<AuthControl>();

  @override
  RouteSettings? redirect(String? route) {
    if (BoardingController.boarding && route != '/boarding')
      return RouteSettings(name: '/boarding');
    if (_authorizationService.isAuthenticated ||
        route == '/login' ||
        route == '/loading') return null;
    if (!_authorizationService.freshStart)
      Future.delayed(Duration(milliseconds: 150), () async {
        await Get.showSnackbar(buildErrorSnackBar(
            'Your access token has been revoked.',
            position: SnackPosition.TOP,
            duration: Duration(seconds: 4),
            margin: EdgeInsets.only(top: 20)));
      });
    return RouteSettings(name: '/login');
  }
}
