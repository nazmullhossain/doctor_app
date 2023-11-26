import 'package:doctor_app/view/about_app.dart';
import 'package:doctor_app/view/contact_us.dart';
import 'package:doctor_app/view/profile_screen/update_agent_profile.dart';
import 'package:doctor_app/view/profile_screen/update_user_profile.dart';
import 'package:doctor_app/view/profile_screen/widgets/img_scanner.dart';
import 'package:doctor_app/view/profile_screen/widgets/reusable_profile_text_bold.dart';
import 'package:doctor_app/view/profile_screen/widgets/prescription_screen.dart';
import 'package:doctor_app/view/profile_screen/widgets/user_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../../controllers/app_controller.dart';
import '../../controllers/user_controller.dart';
import '../Precsciption/my_prescription.dart';

class ProfileScreenUser extends StatefulWidget {
  const ProfileScreenUser({super.key});

  @override
  State<ProfileScreenUser> createState() => _ProfileScreenUserState();
}

class _ProfileScreenUserState extends State<ProfileScreenUser> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    final AppController appController = Get.find();
    print(appController.usertype);
    Future<void> reloadProfileData() async {
      await userController.fetchUserProfile();
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text("Your Profile"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(child: Obx(() {
              if (userController.isUserProfileLoading.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator())),
                  ],
                );
              } else if (userController.userProfile.value != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              radius: 50,
                              foregroundImage: NetworkImage(userController
                                      .userProfile
                                      .value!
                                      .data!
                                      .profilePhotoUrl ??
                                  ''),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(userController.userProfile.value!.data!.name!),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                userController.userProfile.value!.data!.phone!),
                            const SizedBox(
                              height: 10,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.to(() => UpdateUserProfile());
                              },
                              child: const ProfileTextBold(
                          text: 'Update your profile',
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: FlutterSwitch(
                            width: 98.0,
                            height: 42.0,
                            activeText: "বাং",
                            inactiveText: "En",
                            valueFontSize: 12.0,
                            toggleSize: 55.0,
                            value: status,
                            borderRadius: 20.0,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status = val;

                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    SizedBox(height: 6,),
                    const ProfileTextBold(text: "Scan Now"),
                    SizedBox(height: 4,),
                    Container(
                      width: 130,
                      child: InkWell(
                        onTap: () => Get.to(() => ImgScanner()),
                        child: UserProfileCard(
                          image: "assets/images/scan-icon.png",
                          text: "Scanner",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const ProfileTextBold(text: "Records"),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => PrescriptionScreen());
                            },
                            child: SizedBox(
                              width: 130,
                              child: UserProfileCard(
                                image: "assets/images/test.png",
                                text: "Medical Records",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: InkWell(
                              onTap: (){
                                Get.to(MyPrescriptionScreen());
                              },
                              child: UserProfileCard(
                                image: "assets/images/prescription.png",
                                text: "Prescriptions",
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ProfileTextBold(text: "Consultation"),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(

                      children: const [
                        SizedBox(
                    width: 130,
                          child: UserProfileCard(
                            image: "assets/images/past.png",
                            text: "Past consultation",
                          ),
                        ),
                        SizedBox(width: 130,
                          child: UserProfileCard(
                            image: "assets/images/calendar.png",
                            text: "Appointment",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const ProfileTextBold(text: "Legal and support"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Terms and condition",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Privacy policy",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Payment terms",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Frequently Asked Questions",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => AboutAppPage());
                      },
                      child: const Text(
                        "About us",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => ContactUsPage());
                      },
                      child: const Text(
                        "Contact us",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        appController.logout();
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    const Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Text(
                          "v1.00",
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Error: Failed to load profile data.')),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () => reloadProfileData(),
                      child: Text('Retry'),
                    ),
                  ],
                );
              }
            })),
          )),
    );
  }
}
