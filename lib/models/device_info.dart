// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// import 'apps_model.dart';
//
// class DeviceInfo extends IModel {
//   final String uuid;
//   final String appName;
//   final String appVersion;
//   final String buildNumber;
//   final String fcmToken;
//   final String osVersion;
//   final String os;
//   final String brand;
//   final String model;
//
//   DeviceInfo(
//       {required this.uuid,
//       required this.appName,
//       required this.appVersion,
//       required this.buildNumber,
//       required this.fcmToken,
//       required this.osVersion,
//       required this.brand,
//       required this.model,
//       required this.os});
//
//   static Future<DeviceInfo> fromPlatform() async {
//     final packageInfo = await PackageInfo.fromPlatform();
//     final deviceInfo = DeviceInfoPlugin();
//
//     var appName = packageInfo.appName;
//     var appVersion = packageInfo.version;
//     var buildNumber = packageInfo.buildNumber;
//     await Firebase.initializeApp();
//     var t = await FirebaseMessaging.instance.getToken();
//     String fcmToken = t!;
//
//     late final String uuid;
//     late final String model;
//     late final String brand;
//     late final String release;
//     late final os;
//
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       uuid = androidInfo.androidId!;
//       model = androidInfo.model!;
//       // manufacturer = androidInfo.manufacturer!;
//       brand = androidInfo.brand!;
//       release = '${androidInfo.version.sdkInt!}';
//       os = 'android';
//     }
//     if (Platform.isIOS) {
//       IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
//       uuid = iosDeviceInfo.identifierForVendor!;
//       brand = 'Apple';
//       release = iosDeviceInfo.systemVersion!;
//       model = iosDeviceInfo.model!;
//       os = 'ios';
//     }
//
//     return DeviceInfo(
//         uuid: uuid,
//         appName: appName,
//         appVersion: appVersion,
//         brand: brand,
//         model: model,
//         osVersion: release,
//         fcmToken: fcmToken,
//         buildNumber: buildNumber,
//         os: os);
//   }
//
//   @override
//   Map<String, dynamic> toJson() {
//     return {
//       'uuid': uuid,
//       'app_name': appName,
//       'app_version': appVersion,
//       'brand': brand,
//       'model': model,
//       'os_version': osVersion,
//       'os': os,
//       'fcm_token': fcmToken,
//       'build_number': buildNumber,
//     };
//   }
//
//   static DeviceInfo fromJson(dynamic json) {
//     return DeviceInfo(
//         uuid: json['uuid'],
//         appName: json['app_name'],
//         appVersion: json['app_version'],
//         buildNumber: json['build_number'],
//         fcmToken: json['fcm_token'],
//         osVersion: json['version'],
//         brand: json['brand'],
//         model: json['model'],
//         os: json['os']);
//   }
// }
