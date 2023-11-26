// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
//
// class NotificationApi{
//   static final notification=FlutterLocalNotificationsPlugin();
//   static final onNotification=BehaviorSubject<String?>();
//   static  const String groupKey = "a1b2c3";
//
//   static NotificationDetails notificationDetails() {
//
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'high_importance_channel',
//         'High Importance Notifications',
//         channelDescription: 'channelDescription',
//         importance: Importance.high,
//         setAsGroupSummary: true,
//         playSound: true,
//         groupKey: groupKey,
//       ),
//       iOS: IOSNotificationDetails(),
//     );
//   }
//
//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       //'This channel is used for important notifications.', // description
//       importance: Importance.high,
//       playSound: true);
//
//   static Future init({bool initScheduled=false}) async {
//     final android = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     final iOS = IOSInitializationSettings();
//     final settings= InitializationSettings(android: android, iOS: iOS);
//
//     final details= await notification.getNotificationAppLaunchDetails();
//     if(details!=null && details.didNotificationLaunchApp){
//       onNotification.add(details.payload);
//     }
//     await notification.initialize(settings,onSelectNotification: (String? payload){
//       onNotification.add(payload) ;
//       print('onSelectNotification: $payload');
//     });
//
//   }
//
//   static Future showNotification({
//     int id=0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async => notification.show(id, title, body, NotificationDetails(
//     android: AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       setAsGroupSummary: true,
//       groupKey: groupKey,
//       //channel.description,
//       color: Colors.indigo,
//       playSound: true,
//       icon: '@mipmap/ic_launcher',
//     ),
//
//   ), payload: payload);
//
//
//   static Future showNotificationBigPicture({
//     int id=0,
//     String? title,
//     String? body,
//     String? payload,
//     String? bigPicture,
//   }) async => notification.show(id, title, body, NotificationDetails(
//     android: AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//
//       //channel.description,
//       color: Colors.indigo,
//       playSound: true,
//       setAsGroupSummary: true,
//       groupKey: groupKey,
//       icon: '@mipmap/ic_launcher',
//     ),
//
//   ), payload: payload);
//
// }