import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/view/doctor_screen/widgets/all_doctors.dart';
import 'package:doctor_app/view/doctor_screen/widgets/search_doctors_screen.dart';
import 'package:doctor_app/view/doctor_screen/widgets/short_doctors_list_screen.dart';
import 'package:doctor_app/view/doctor_screen/widgets/bold_text.dart';
import 'package:doctor_app/view/doctor_screen/widgets/departments.dart';
import 'package:doctor_app/view/doctor_screen/widgets/instant_consulting_doctors.dart';
import 'package:doctor_app/view/doctor_screen/widgets/specialist_doctors.dart';
import 'package:doctor_app/view/doctor_screen/widgets/symptoms.dart';
import 'package:doctor_app/view/doctor_screen/widgets/type_wise_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart';
import '../../global_widgets/custom_tab_bar.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    userController.fetchAllDoctors();
    userController.fetchRandomDoctors();
    userController.fetchAvailableDoctors();
    AppController appController = Get.find();
    print(appController.token!);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            toolbarHeight: 90,
            title: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.video_camera_back),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Video Consultation as you need"),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 40,
                      child: TextField(
                        onChanged: userController.searchDoctorsInDrHome,
                        decoration: InputDecoration(
                          hintText: "Search Doctors",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      )),
                ],
              ),
            ),
          ),
          body: Obx(() {
            if (userController.foundDoctorsInDrHome.isNotEmpty) {
              return SearchDoctors(
                  doctorsData: userController.foundDoctorsInDrHome);
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      const BoldText(text: "Video Consultation as you need"),
                      const SizedBox(height: 8),
                      InstantConsultingDoctor(doctors: userController.availableDoctors),
                      const SizedBox(height: 15),
                      // const BoldText(text: "বিশেষজ্ঞ ডাক্তারের পরামর্শ নিন"),
                      // const SizedBox(height: 8),
                      // SpecialistDoctors(doctors: userController.doctors),
                      // const SizedBox(height: 15),
                      const Divider(),
                      const Divider(),
                      const BoldText(text: "Choose a symptom or department"),
                      const Text("Find your doctor as your need"),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 700,
                        child: CustomTabBar(
                          tab1: SizedBox(child: Departments()),
                          tab2: SizedBox(child: SymptomsCategory()),
                          tab1Name: 'Departments',
                          tab2Name: 'Symptoms',
                        ),
                      ),
                      // const Divider(),
                      const Divider(),
                      // const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BoldText(
                              text: "Available Doctors",
                            ),
                            SizedBox(
                              height: 20,
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.to(() => AllDoctorsScreen());
                                },
                                child: const Text("View All"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 1200,
                          child: ShortDoctorsListScreen(
                              doctors: userController.randomDoctors)),
                    ],
                  ),
                ),
              );
            }
          })),
    );
  }
}
