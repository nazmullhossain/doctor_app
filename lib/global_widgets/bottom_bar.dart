import 'dart:async';
import 'dart:io';
import 'package:doctor_app/local_save.dart';
import 'package:doctor_app/notificatrion/notification_controller.dart';
import 'package:http/http.dart' as http;
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/view/doctor_screen/doctor_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../call_end_page.dart';
import '../view/consulting_screen/consulting.dart';
import '../view/diagnostic/diagonstic_center.dart';
import '../view/doctor_home/doctor_home.dart';
import '../view/profile_screen/doctor_profile_screen.dart';
import '../view/profile_screen/profile_screen_agent.dart';
import '../view/profile_screen/profile_screen_user.dart';
import '../view/user_home/user_home.dart';
import '../view/work_screen/work_screen.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../zego/zego_cloud.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  ZegoUIKitPrebuiltCallController? callControllerDoctor;
  final AppController appController = Get.find();

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
  void initState() {
    super.initState();
    postBody();
    print("USER__TYPE__${appController.usertype}");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _getCameraPermissions();
      await _getMicPermissions();
      await _getPhone();

      onUserLogin();

    });
  }

  int _selectedIndex = 0;
  String? fbTOken;

  postBody() async {
    await SharedData().getToken().then((value) {
      setState(() {
        fbTOken = value;
      });
    });
    var response = await http.post(
      Uri.parse("https://www.treatmenticwl.com/api/set/device-token"),
      headers: {"Authorization": "Bearer ${appController.token}"},
      body: {"device_token": "$fbTOken"},
    );
    if (response.statusCode == 200) {
      await getUserData();
      setState(() {
        print("OK GOT IT");

        print("RES_Message_${response.body}");
      });
    }
  }
NotificationController notificationController = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    notificationController.getData();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedFontSize: 10,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    "assets/images/home.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    "assets/images/home.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(
                      appController.usertype == "user" ||
                              appController.usertype == "agent"
                          ? "assets/images/stetho.png"
                          : "assets/images/briefcase-icon.png",
                      height: 20,
                      width: 30,
                    ),
                  ),
                  activeIcon: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(
                      appController.usertype == "user" ||
                              appController.usertype == "agent"
                          ? "assets/images/stetho.png"
                          : "assets/images/briefcase-icon.png",
                      height: 20,
                      width: 30,
                    ),
                  ),
                  label: appController.usertype == "doctor"
                      ? "Work"
                      : "Doctors"),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    appController.usertype == "user" ||
                            appController.usertype == "agent"
                        ? "assets/images/diagnostic.png"
                        : "assets/images/consult.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    appController.usertype == "user" ||
                            appController.usertype == "agent"
                        ? "assets/images/diagnostic.png"
                        : "assets/images/consult.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                label: appController.usertype == "doctor"
                    ? 'Consultation'
                    : 'Diagnostic',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    "assets/images/profile-icon.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    "assets/images/profile-icon.png",
                    height: 20,
                    width: 30,
                  ),
                ),
                label: 'Profile',
              )
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          )),
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3)
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          appController.usertype == "doctor" ? DoctorHome() : UserHome(),
          appController.usertype == "doctor"
              ? const WorkScreen()
              : DoctorScreen(),
          appController.usertype == "doctor"
              ? ConsultingScreen()
              : Diagnostic(),
          appController.usertype == "doctor"
              ? DoctorProfileScreen()
              : appController.usertype == "agent"
                  ? ProfileScreenAgent()
                  : ProfileScreenUser()
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
