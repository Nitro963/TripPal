import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../values/storage_keys.dart';

class BoardingMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isBoarding = GetStorage().read<bool>(StorageKeys.IS_BOARDING);
    if (isBoarding ?? true) return null;
    return const RouteSettings(name: '/login');
  }
}
