import 'package:doctor_app/localization/language_screen.dart';
import 'package:doctor_app/view/landing_screen/widgets/custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/app_controller.dart';
import '../auth/login_screen.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    print(appController.token);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(end: Alignment.bottomCenter, colors: [
          Colors.deepPurple,
          Colors.white,
        ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              children: [
                Center(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 200),
                        child: Image.asset(
                          "assets/images/with slogan.png",
                        ))),
                const Center(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: UpsideDownTriangleWidget())),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  appController.setUsertype("doctor");
                                  Get.to(() => LoginScreen());
                                },
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      "assets/images/doctor-icon.png"),
                                )),
                            Text(
                              "doctor".tr,
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  appController.setUsertype("agent");
                                  Get.to(() => LoginScreen());
                                },
                                child: const CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage("assets/images/agent.png"))),
                            Text(
                              "agent".tr,
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              appController.setUsertype("user");
                              Get.to(() => LoginScreen());
                            },
                            child: const CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    "assets/images/group-icon.png"))),
                        Text(
                          "user".tr,
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tap on the icons to navigate",
                    ),

                    // const SizedBox(
                    //   height: 60,
                    // ),
                    // GestureDetector(
                    //   onTap: (){
                    //     Get.to(LanguageScreen());
                    //   },
                    //   child: Center(
                    //     child: Container(
                    //       padding: EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)
                    //       ),
                    //       child: const Text(
                    //         "You can change your language",
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
