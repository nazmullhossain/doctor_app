import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:doctor_app/localization/language_controller.dart';
import 'package:doctor_app/localization/language_contsnace.dart';
import 'package:doctor_app/localization/messages.dart';
import 'package:doctor_app/zego/zego_cloud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'controllers/app_controller.dart';
import 'notificatrion/my_notification.dart';
import 'notificatrion/notification_api.dart';
import 'view/splash_screen/splash_screen.dart';
import 'localization/dep.dart' as dep;

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message ${message.messageId}');
//
//   print('imageUrl');
//
//   print(message.data["image"]);
//
//   print('Handling a background message ${message.messageId}');
//   await AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: message.hashCode,
//       channelKey: "high_importance_channel",
//       title: message.data['title'],
//       body: message.data['body'],
//       notificationLayout: NotificationLayout.BigPicture,
//       hideLargeIconOnExpand: true,
//     ),
//   );
// }

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then(
        (value) {
      if (value) {
        Permission.notification.request();
      }
    },
  );

  Map<String, Map<String, String>> languages = await dep.init();
  await Firebase.initializeApp();

 // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.locationWhenInUse,
    Permission.notification,
  ].request();

  print(statuses[Permission.location]);

  // AwesomeNotifications().initialize(
  //     'resource://drawable/res_logo',
  //     [
  //       NotificationChannel(
  //           importance: NotificationImportance.High,
  //           ledOnMs: 1000,
  //           ledOffMs: 500,
  //           channelKey: 'high_importance_channel',
  //           playSound: true,
  //           channelName: 'high_importance_channel',
  //           channelDescription: 'Notification channel for TreatMent',
  //           defaultColor: Color(0xFFEFEFEF),
  //           ledColor: Colors.white),
  //     ],
  //     debug: true);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final navigatorKey = GlobalKey<NavigatorState>();
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(MyApp(
      navigatorKey: navigatorKey,
      languages: languages,
    ));
  });

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    required this.navigatorKey,
    Key? key,
    required this.languages,
  }) : super(key: key);

  final Map<String, Map<String, String>> languages;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //MyNotification myNotification = MyNotification();

  ZegoUIKitPrebuiltCallController? callControllerDoctor;
  MyNotification myNotification = MyNotification();
  String? id;
  String? name;
  String? phone;
  String? userType;

  AppController appController = Get.put(AppController());

  Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    appController.getId().then((value) {
      id = sharedPreferences.getString("id");

      print("ID A${id}");
    });
    appController.getName().then((value) {
      name = sharedPreferences.getString("name");
      print("ID A${name}");
    });

    appController.getPhone().then((value) {
      phone = sharedPreferences.getString("phone");
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    if (appController.token!.isNotEmpty) {
      onUserLogin();
    }
    NotificationApi.init();
    myNotification.remoteMessage();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return OverlaySupport(
          child: GetMaterialApp(
              locale: localizationController.locale,
              translations: Messages(languages: widget.languages),
              fallbackLocale: Locale(
                LanguageConstance.languageModel[0].languageCode,
                LanguageConstance.languageModel[0].countryCode,
              ),
              initialBinding: AppBinding(),
              theme: ThemeData.light().copyWith(
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
              navigatorKey: widget.navigatorKey,
              darkTheme: ThemeData.dark().copyWith(
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  foregroundColor: Colors.white,
                ),
              ),
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: SplashScreen()));
    });
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController());
  }
}
