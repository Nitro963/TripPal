import 'dart:async';
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:recase/recase.dart';
import 'package:trip_pal_null_safe/models/notification.dart';

// Singleton class for the ease of accessibility in FCM background handler
class NotificationService {
  final FlutterLocalNotificationsPlugin _flip =
      FlutterLocalNotificationsPlugin();

  late final NotificationAppLaunchDetails? _notificationAppLaunchDetails;
  NotificationService._internal();

  Future<bool?> _initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // /// Note: permissions aren't requested here just to demonstrate that can be
    // /// done later
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(
    //         requestAlertPermission: false,
    //         requestBadgePermission: false,
    //         requestSoundPermission: false,
    //         onDidReceiveLocalNotification: (
    //           int id,
    //           String? title,
    //           String? body,
    //           String? payload,
    //         ) async {
    //           didReceiveLocalNotificationSubject.add(
    //             ReceivedNotification(
    //               id: id,
    //               title: title,
    //               body: body,
    //               payload: payload,
    //             ),
    //           );
    //         });
    // const MacOSInitializationSettings initializationSettingsMacOS =
    //     MacOSInitializationSettings(
    //   requestAlertPermission: false,
    //   requestBadgePermission: false,
    //   requestSoundPermission: false,
    // );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
      // macOS: initializationSettingsMacOS,
    );

    var ret = await _flip.initialize(initializationSettings,
        onSelectNotification: handlePayload);
    _notificationAppLaunchDetails =
        await _flip.getNotificationAppLaunchDetails();
    return ret;
  }

  NotificationAppLaunchDetails? get notificationAppLaunchDetails =>
      _notificationAppLaunchDetails;

  bool _handledLaunch = false;

  bool get didNotificationLaunchApp =>
      (_notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) &
      !_handledLaunch;

  static Future<void> initialize() async {
    if (_instance != null) return;
    var service = NotificationService._internal();
    await service._initialize();
    _instance = service;
  }

  static NotificationService? _instance;

  static NotificationService get instance {
    return _instance!;
  }

  Future<void> showPlainNotification(int id, String title, String body,
      {String? payload}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('TripPal', 'TripPal', 'TripPal app channel',
            importance: Importance.max, priority: Priority.high);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flip.show(id, title.titleCase, body, platformChannelSpecifics,
        payload: payload);
  }

  Future<void> handlePayload(String? payload) async {
    print(payload);
    if (payload != null) {
      var notification = Notification.fromJson(json.decode(payload));
      switch (notification.resource) {
        default:
          _handleSelectNotification(notification);
          break;
      }
    }
  }

  Future<void> _handleSelectNotification(Notification notification) async {}
}
