import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(context) {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationPlugin.initialize(initializationSettings,
        onSelectNotification: (String route) async {
      if (route != null) {
        Navigator.of(context).pushNamed(route);
      }
    });
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("jobista", "jobista channel",
              importance: Importance.max, priority: Priority.max));

      try {
        print(message.data['worker']);
        if (int.parse(message.data['worker']) > 0 ) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setInt('worker_id', int.parse(message.data['worker']));
        }
      } catch (e) {
        print(e);
      }
      await _notificationPlugin.show(id, message.notification.title,
          message.notification.body, notificationDetails,
          payload: message.data['route'].toString());
    } on Exception catch (e) {
      print(e);
    }
  }
}
