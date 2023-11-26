// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class MyNotification{
//
//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       //'This channel is used for important notifications.', // description
//       importance: Importance.high,
//       playSound: true);
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   //
//   // MessageDetailModel? messageDetailModel;
//   //
//   //
//   // Future<MessageDetailModel?> getMessageDetail(
//   //     String conversionId, bool needLoading) async {
//   //   // if (needLoading) {
//   //   //   setState(() {
//   //   //     isLoder = true;
//   //   //   });
//   //   // }
//   //
//   //   String? token;
//   //   await MyPrefs.getToken().then((value) {
//   //
//   //       token = value;
//   //
//   //   });
//   //   var url = "https://developmentsite.rebusel.com/api/v1/conversations/$conversionId";
//   //   var res = await http.get(
//   //     Uri.parse("$url"),
//   //     headers: {"Authorization": "Bearer $token"},
//   //   );
//   //   if (res.statusCode == 200) {
//   //     print("URL__${url}->${token}");
//   //     // log(res.body);
//   //     // setState(() {
//   //       messageDetailModel = messageDetailModelFromJson(res.body);
//   //       // isLoder = false;
//   //       // needScrool = true;
//   //
//   //       // _streamController.add(messageDetailModel);
//   //     // });
//   //   } else {
//   //     // setState(() {
//   //     //   isLoder = false;
//   //     // });
//   //   }
//   //
//   //   return messageDetailModel;
//   // }
//
//   void remoteMessage(){
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
//       var token;
//
//
//
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         print("--Hello ${notification.body}");
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 //channel.description,
//                 // color: Colors.blue,
//                 playSound: true,
//                 icon: '@mipmap/ic_launcher',
//               ),
//             ));
//
//       }
//       // if(!isChatOpen){
//       //   if(isLogin){
//       //     RemoteNotification? notification = message.notification;
//       //     AndroidNotification? android = message.notification?.android;
//       //     if (notification != null && android != null) {
//       //       flutterLocalNotificationsPlugin.show(
//       //           notification.hashCode,
//       //           notification.title,
//       //           notification.body,
//       //           NotificationDetails(
//       //             android: AndroidNotificationDetails(
//       //               channel.id,
//       //               channel.name,
//       //               //channel.description,
//       //               color: Colors.blue,
//       //               playSound: true,
//       //               icon: '@mipmap/ic_launcher',
//       //             ),
//       //           ));
//       //     }
//       //   }
//       // }else{
//       //   if(cd.millisecondsSinceEpoch>milis){
//       //     if(isLogin){
//       //       RemoteNotification? notification = message.notification;
//       //       AndroidNotification? android = message.notification?.android;
//       //       if (notification != null && android != null) {
//       //         flutterLocalNotificationsPlugin.show(
//       //             notification.hashCode,
//       //             notification.title,
//       //             notification.body,
//       //             NotificationDetails(
//       //               android: AndroidNotificationDetails(
//       //                 channel.id,
//       //                 channel.name,
//       //                 //channel.description,
//       //                 color: Colors.blue,
//       //                 playSound: true,
//       //                 icon: '@mipmap/ic_launcher',
//       //               ),
//       //             ));
//       //       }
//       //     }
//       //   }
//       // }
//
//
//     });
//   }
//
//   void onMessageOpenApp(BuildContext context){
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A new onMessageOpenedApp event was published!');
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//
//         // Fluttertoast.showToast(msg: "${notification.title} ${notification.body}");
//         print("${notification.title} ${notification.body}");
//         // showDialog(
//         //     context: context,
//         //     builder: (_) {
//         //       return AlertDialog(
//         //         title: Text(notification.title!),
//         //         content: SingleChildScrollView(
//         //           child: Column(
//         //             crossAxisAlignment: CrossAxisAlignment.start,
//         //             children: [Text(notification.body!)],
//         //           ),
//         //         ),
//         //       );
//         //     });
//       }
//     });
//   }
//
//
//   void showNotification() {
//
//     flutterLocalNotificationsPlugin.show(
//         0,
//         "Testing Notification",
//         "How you doin ?",
//         NotificationDetails(
//             android: AndroidNotificationDetails(channel.id, channel.name,
//                 importance: Importance.high,
//                 //  color: Colors.blue,
//                 playSound: true,
//
//                 icon: '@mipmap/ic_launcher')));
//   }
//   static  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     await Firebase.initializeApp();
//     print('A bg message just showed up :  ${message.messageId}');
//   }
//
//
// }