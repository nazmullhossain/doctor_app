import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/global_widgets/custom_card.dart';
import 'package:doctor_app/view/profile_screen/widgets/update_dr_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../controllers/dr_controller.dart';

class DoctorProfileScreen extends StatefulWidget {
  DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final AppController appController = Get.find();
  bool status = false;
  String? selectedCountry;
  @override
  Widget build(BuildContext context) {
    final DrController drController = Get.find();
    Future<void> reloadProfileData() async {
      await drController.fetchDoctorProfile();
    }


    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(
        child: Obx(() {
          if (drController.drProfileIsLoading.value) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            );
          } else if (drController.doctorProfile.value != null) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                      height: 200,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff0043ba),
                                      Color(0xff006df1)
                                    ]),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Obx(
                                    () => Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(drController
                                                    .doctorProfile
                                                    .value!
                                                    .data!
                                                    .profilePhotoUrl!
                                                    .isNotEmpty
                                                ? drController
                                                    .doctorProfile
                                                    .value!
                                                    .data!
                                                    .profilePhotoUrl!
                                                : 'https://cdn.pixabay.com/photo/2017/05/15/23/47/stethoscope-icon-2316460_1280.png')),
                                      ),
                                    ),
                                  ),
                                  Obx(() {
                                    if (drController.doctorProfile.value!
                                            .statusMessage ==
                                        'Available') {
                                      return Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          child: Container(
                                            margin: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  })
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        final status =
                            drController.doctorProfile.value!.statusMessage ==
                                    'Available'
                                ? '0'
                                : '1';

                        await drController.updateStatus(status, context);
                        await drController.fetchDoctorProfile();
                        print(drController.doctorProfile.value!.statusMessage);
                      },
                      child: Text('Switch Status'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, top: 18),
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
                  Container(
                    margin: EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomCard(
                            column: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.circle_outlined,
                                      color: Colors.cyan,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Obx(
                                      () => Text(
                                        drController
                                            .doctorProfile.value!.data!.name!,
                                      ),
                                    ),
                                    Expanded(child: SizedBox())
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: Colors.cyan,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Obx(() => Text(
                                        "${drController.doctorProfile.value!.data!.email!}")),
                                    Expanded(child: SizedBox())
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.cyan,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Obx(() => Text(
                                          drController.doctorProfile.value!
                                              .data!.phone!,
                                        )),
                                    Expanded(child: SizedBox())
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      drController.doctorProfile.value!.data!
                                                  .gender ==
                                              'female'
                                          ? Icons.female
                                          : Icons.male,
                                      color: Colors.cyan,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      drController.doctorProfile.value!.data!
                                              .gender ??
                                          '',
                                    ),
                                    Expanded(child: SizedBox())
                                  ],
                                ),



                                Divider(),
                                ListTile(
                                  title: Text(
                                    'About',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Obx(() => Text(
                                        drController.doctorProfile.value!.data!
                                                .about ??
                                            '',

                                      )),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.cyanAccent,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.to(() => UpdateDrProfile());
                                    },
                                    child: Text("Edit Profile"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomCard(
                              column: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.help,
                                    color: Colors.cyan,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Help & Support"),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(Icons.navigate_next),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.privacy_tip,
                                    color: Colors.cyan,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Privacy policy"),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(Icons.navigate_next),
                                ],
                              ),
                              Divider(),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.cyan,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Settings"),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(Icons.navigate_next),
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.brightness_2_outlined,
                                      color: Colors.cyan,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Switch Theme"),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Switch(
                                      activeColor: Colors.cyan,
                                      value: appController.isDarkMode.value,
                                      onChanged: (value) {
                                        appController.toggleTheme();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                  height: 22,
                                  child: OutlinedButton(
                                      onPressed: () {
                                        appController.logout();
                                      },
                                      child: Text("Log Out"))),
                            ],
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: Failed to load profile data.'),
                  ElevatedButton(
                    onPressed: () => reloadProfileData(),
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }
        }),
      )),
    );
  }
}
