import 'package:doctor_app/model/all_doctors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/dr_by_dept.dart';
import '../../../../model/dr_by_symptom.dart';
import '../../../consultation_details.dart';
import '../dr_profile_to_user/dr_profile_to_user.dart';
import 'dr_profile.dart';

class SearchDoctorsInSymptomScreen extends StatelessWidget {
  final List<DoctorBySymptom> doctorsData;

  const SearchDoctorsInSymptomScreen ({Key? key, required this.doctorsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 340,
                ),
                itemCount: doctorsData.length,
                itemBuilder: (context, index) {
                  final doctor = doctorsData[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => DrProfile(drId:doctor.id!));
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
                                    child: doctor.profilePhotoUrl == null
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
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      doctor.status == true ? "Online" : "Offline",
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}
