
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../call_end_page.dart';
ZegoUIKitPrebuiltCallController? callController;


void onUserLogin() async {
  final prefs = await SharedPreferences.getInstance();
  AppController appController = Get.find();

  callController ??= ZegoUIKitPrebuiltCallController();
  print("AAA__${prefs.getString("id")}");

  /// 4/5. initialized ZegoUIKitPrebuiltCallInvitationService when account is logged in or re-logged in
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 160386179 /*input your AppID*/,
    appSign: "c4498f39f3f113c60cb6f56680be463bfda4fa4e78f13c0e3b481933bc6b1717",
    userID: prefs.getString("id") ?? "",
    userName: prefs.getString("name") ?? "",
    notifyWhenAppRunningInBackgroundOrQuit: true,
    androidNotificationConfig: ZegoAndroidNotificationConfig(
      channelID: "ZegoUIKit",
      channelName: "Call Notifications",
      sound: "notification",
    ),
    iOSNotificationConfig: ZegoIOSNotificationConfig(
      isSandboxEnvironment: false,
      systemCallingIconName: 'CallKitIcon',
    ),
    plugins: [ZegoUIKitSignalingPlugin()],
    controller: callController,
    requireConfig: (ZegoCallInvitationData data) {
      final config = (data.invitees.length > 1)
          ? ZegoCallType.videoCall == data.type
          ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
          : ZegoCallType.videoCall == data.type
          ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

      // config.avatarBuilder = customAvatarBuilder;

      /// support minimizing, show minimizing button
      config.topMenuBarConfig.isVisible = true;
      config.topMenuBarConfig.buttons
          .insert(0, ZegoMenuBarButtonName.minimizingButton);
      config.onHangUpConfirmation = (BuildContext context) async {
        if(appController.usertype == "user"
             ){
          return await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blue[900]!.withOpacity(0.9),
                title: const Text("User",
                    style: TextStyle(color: Colors.white70)),
                content: const Text("You have don't Permission the call end.",
                    style: TextStyle(color: Colors.white70)),
                actions: [
                  ElevatedButton(
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.white70)),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  // ElevatedButton(
                  //   child: const Text("Exit"),
                  //   onPressed: () => Get.offAll(CallEndPage()),
                  // ),
                ],
              );
            },
          );
        }else{
          return await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blue[900]!.withOpacity(0.9),
                title: const Text("Call End?",
                    style: TextStyle(color: Colors.white70)),
                content: const Text("Do you want to exit",
                    style: TextStyle(color: Colors.white70)),
                actions: [
                  ElevatedButton(
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.white70)),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ElevatedButton(
                    child: const Text("Exit"),
                    onPressed: () => Get.offAll(CallEndPage()),
                  ),
                ],
              );
            },
          );
        }


      };
      return config;
    },
  );
}
