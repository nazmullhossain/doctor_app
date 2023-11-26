import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
@pragma('vm:entry-point')
class MyNotification {
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      //'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future init({bool initSchedule = false}) async {}

  void remoteMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('onMessage: ${message.data}');
      message.data.forEach((key, value) {
        log('$key: $value');
      });

      if (message.data['title'] != null) {
        if (message.data['image'] != null) {
          Map<String, String> map = Map();
          for (var item in message.data.keys) {
            map[item] = message.data[item];
          }
          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 10,
                  notificationLayout: NotificationLayout.BigPicture,
                  channelKey: 'basic_channel',
                  title: '${message.data['title']}',
                  body: message.data['body'],
                  payload: map));
        } else {
          // NotificationApi.showNotification(id: 101,title: message.data['title'],body: "",payload: jsonEncode(message.data));
        }
      } else {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  //channel.description,
                  channelDescription: 'your other channel description',
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                  sound: RawResourceAndroidNotificationSound('ringtone'), // Add the sound here
                ),
              ));
        } else {}
      }
    });
  }

  void onMessageOpenApp(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // Fluttertoast.showToast(msg: "${notification.title} ${notification.body}");
        print("${notification.title} ${notification.body}");
      }
    });
  }
}
