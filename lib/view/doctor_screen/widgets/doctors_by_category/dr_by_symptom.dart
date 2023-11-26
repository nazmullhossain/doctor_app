import 'package:doctor_app/controllers/user_controller.dart';
import 'package:doctor_app/model/all_doctors.dart';
import 'package:doctor_app/model/dr_by_dept.dart';
import 'package:doctor_app/view/doctor_screen/widgets/doctors_by_category/search_doctor_in_symptoms.dart';
import 'package:doctor_app/view/doctor_screen/widgets/search_doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consultation_details.dart';
import '../dr_profile_to_user/dr_profile_to_user.dart';
import 'dr_profile.dart';

class DoctorsBySymptomScreen extends StatefulWidget {
  final int symptomId;

  DoctorsBySymptomScreen({
    Key? key,
    required this.symptomId,
  }) : super(key: key);

  @override
  State<DoctorsBySymptomScreen> createState() => _DoctorsBySymptomScreenState();
}

class _DoctorsBySymptomScreenState extends State<DoctorsBySymptomScreen> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    userController.fetchDoctorsBySymptom(widget.symptomId);
    Future<void> reload() async {
      await userController.fetchDoctorsBySymptom(widget.symptomId);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: SizedBox(
            height: 40,
            child: TextField(
              onChanged: userController.searchDoctorsInSymptom,
              decoration: InputDecoration(
                hintText: "Search Doctors",
                hintStyle: TextStyle(fontSize: 14),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if (userController.foundDoctorsInSymptom.isNotEmpty) {
              return SearchDoctorsInSymptomScreen(
                  doctorsData: userController.foundDoctorsInSymptom);
            } else if (userController.isDrBySymptomLoading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (userController.doctorsBySymptom.isNotEmpty) {
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 340,
                      ),
                      itemCount: userController.doctorsBySymptom.length,
                      itemBuilder: (context, index) {
                        final doctor = userController.doctorsBySymptom[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => DrProfile(
                                  drId: doctor.id!,
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Card(
                                      elevation: 3,
                                      child: SizedBox(
                                        height: 150,
                                        width: 145,
                                        child: Center(
                                          child: doctor.profilePhotoUrl!.isEmpty
                                              ? Image.asset(
                                                  "assets/images/stetho.png",
                                                  height: 55,
                                                )
                                              : CircleAvatar(
                                                  radius: 70,
                                                  foregroundImage: NetworkImage(
                                                    doctor.profilePhotoUrl!,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 12,
                                      top: 12,
                                      child: Container(
                                        height: 20,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.lightGreen,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text(
                                            doctor.status == true
                                                ? "Online"
                                                : "Offline",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    doctor.name!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    Text(
                                      "(200)",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      doctor.avgRatingStars == null
                                          ? "Avg rating?"
                                          : doctor.avgRatingStars.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Get.to(() => ConsultationForm());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(Icons.video_call),
                                        Text("ডাক্তার দেখান"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No data'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () => reload(),
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }
          })),
    );
  }
}
