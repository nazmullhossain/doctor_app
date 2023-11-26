import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/global_widgets/bottom_bar.dart';
import 'package:doctor_app/view/landing_screen/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../call_end_page.dart';
import '../../local_save.dart';
import '../../model/push_model.dart';
import '../../notification_bloc.dart';
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
// }
// Future<void> backgroundHandeler(RemoteMessage message) async {
//   awe.AwesomeNotifications().createNotification(
//     content: awe.NotificationContent(
//       id: 123,
//       channelKey: "channelKey",
//
//       color: Colors.white,
//       category: awe.NotificationCategory.Message,
//       wakeUpScreen: true,
//       title: message.data['title'],
//       body: message.data['body'],
//       fullScreenIntent: true,
//       autoDismissible: false,
//       backgroundColor: Colors.orange,
//       displayOnBackground: true,
//       displayOnForeground: true,
//     ),
//   );
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  //FCM Start

  late final FirebaseMessaging _messaging;
  late int _totalNotifications;
  PushNotification? _notificationInfo;

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    _messaging.getToken().then((value) async {
      print("VAL__${value}");
      await SharedData().setToken(value!);
    });
    // FirebaseMessaging.onBackgroundMessage(backgroundHandeler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');

        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
          path: message.data['path'],
        );
        notificationBloc.notification(notification);
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
          title: initialMessage.notification?.title,
          body: initialMessage.notification?.body,
          dataTitle: initialMessage.data['title'],
          dataBody: initialMessage.data['body'],
          path: initialMessage.data['path']);

      print("Abir${notification.path}");

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }

  ///FCM END

  final appController = Get.find<AppController>();
  Timer? timer;
  ZegoUIKitPrebuiltCallController? callControllerDoctor;

  String? id;
  String? name;
  String? phone;
  String? userType;
  Future<void> _getMicPermissions() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      await Permission.microphone.request();
    }
  }

  Future<void> _getCameraPermissions() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      await Permission.camera.request();
    }
  }

  Future<void> _getPhone() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      await Permission.phone.request();
    }
  }

  Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      appController.getId().then((value) {
        setState(() {
          id = sharedPreferences.getString("id");
        });
        print("ID A${id}");
      });
      appController.getName().then((value) {
        setState(() {
          name = sharedPreferences.getString("name");
          print("ID A${name}");
        });
      });

      appController.getPhone().then((value) {
        setState(() {
          phone = sharedPreferences.getString("phone");
        });
      });
    });
  }

  @override
  @override
  void initState() {
    super.initState();

    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
        path: message.data['path'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });

    Timer(const Duration(seconds: 3), () async {
      if (kDebugMode) {}

      if (_notificationInfo != null) {
        //Get.off(const NotificationScreen());
      } else {
        //Get.to(NewHomeScreen());
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getUserData();
      await _getCameraPermissions();
      await _getMicPermissions();
      await _getPhone();
      // Timer(Duration(seconds: 1), () {
      //   callControllerDoctor ??= ZegoUIKitPrebuiltCallController();
      //   ZegoUIKitPrebuiltCallInvitationService().init(
      //     appID: 160386179 /*input your AppID*/,
      //     appSign:
      //         "c4498f39f3f113c60cb6f56680be463bfda4fa4e78f13c0e3b481933bc6b1717" /*input your AppSign*/,
      //     userID: id.toString(),
      //     userName: name.toString(),
      //     notifyWhenAppRunningInBackgroundOrQuit: false,
      //     plugins: [ZegoUIKitSignalingPlugin()],
      //     controller: callControllerDoctor,
      //     requireConfig: (ZegoCallInvitationData data) {
      //       final config = (data.invitees.length > 1)
      //           ? ZegoCallType.videoCall == data.type
      //               ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
      //               : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
      //           : ZegoCallType.videoCall == data.type
      //               ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
      //               : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
      //
      //       /// support minimizing, show minimizing button
      //       config.topMenuBarConfig.isVisible = true;
      //       config.topMenuBarConfig.buttons
      //           .insert(0, ZegoMenuBarButtonName.minimizingButton);
      //       appController.usertype == "user"
      //           ? Container()
      //           : config.onHangUpConfirmation = (BuildContext context) async {
      //               return await showDialog(
      //                 context: context,
      //                 barrierDismissible: false,
      //                 builder: (BuildContext context) {
      //                   return AlertDialog(
      //                     backgroundColor: Colors.blue[900]!.withOpacity(0.9),
      //                     title: const Text("Call End?",
      //                         style: TextStyle(color: Colors.white70)),
      //                     content: const Text("Do you want to exit",
      //                         style: TextStyle(color: Colors.white70)),
      //                     actions: [
      //                       ElevatedButton(
      //                         child: const Text("Cancel",
      //                             style: TextStyle(color: Colors.white70)),
      //                         onPressed: () => Navigator.of(context).pop(false),
      //                       ),
      //                       ElevatedButton(
      //                         child: const Text("Exit"),
      //                         onPressed: () => Get.offAll(CallEndPage()),
      //                       ),
      //                     ],
      //                   );
      //                 },
      //               );
      //             };
      //       return config;
      //     },
      //   );
      // });
    });
    timer = Timer(const Duration(seconds: 3), () async {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('No Internet Connection'),
              content:
                  Text('Please check your internet connection and try again.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        if (appController.token!.isNotEmpty &&
            appController.usertype!.isNotEmpty) {
          Get.off(() => CustomBottomBar());
        } else {
          Get.off(() => LandingScreen());
        }
      }
    });
    // awe.AwesomeNotifications().initialize(null, [
    //   awe.NotificationChannel(
    //       channelKey: "channelKey",
    //       channelName: "channelName",
    //       channelDescription: "channelDescription",
    //       defaultColor: Colors.red,
    //       ledColor: Colors.white,
    //       importance: awe.NotificationImportance.Max,
    //       locked: true,
    //       channelShowBadge: true,
    //       defaultRingtoneType: awe.DefaultRingtoneType.Ringtone),
    // ]);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2EEE4),
        body: Image.asset(
          "assets/images/splash.jpg",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ));
  }
}
