import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/about.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/reviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/dr_controller.dart';
import '../../../../global_widgets/custom_tab_bar.dart';

class WorkProfile extends StatelessWidget {
  WorkProfile({Key? key}) : super(key: key);
  final AppController appController = Get.find();
  final DrController drController = Get.find();
  @override
  Widget build(BuildContext context) {
    Future<void> reloadProfileData() async {
      await drController.fetchDoctorProfile();
    }

    return SafeArea(
        child: Scaffold(

      body: SingleChildScrollView(
        child: Obx(() {
          if (drController.drProfileIsLoading.value) {
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
          } else if (drController.doctorProfile.value != null) {
            return Column(
              children: [
                SizedBox(
                  height: 230,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.cyan),
                      ),
                      Positioned(
                        top: 30,
                        child: Card(
                          margin: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width - 24,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: drController.doctorProfile.value!
                                                      .data!.profilePhotoUrl ==
                                                  null
                                              ? Image.asset(
                                                  "assets/images/stethoscope.png",
                                                  height: 70,
                                                  width: 80,
                                                )
                                              : Image.network(
                                                  drController
                                                      .doctorProfile
                                                      .value!
                                                      .data!
                                                      .profilePhotoUrl!,
                                                  height: 70,
                                                  width: 80,
                                                ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                drController.doctorProfile.value!
                                                    .data!.name!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width - 150,
                                                child: Wrap(
                                                  alignment: WrapAlignment.start,
                                                  children: drController.doctorProfile.value!.data!.educations!.map((e) => Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                                    child: Text(
                                                      '${e.degree}, ',
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  )).toList(),
                                                ),
                                              ),



                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "BMDC No.: ${drController.doctorProfile.value!.data!.bmdcNo ?? ''}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 2000,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomTabBar(
                    tab1: About(),
                    tab2: Reviews(),
                    tab1Name: "About",
                    tab2Name: "Reviews",
                  ),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Error: Failed to load profile data.'),
                ElevatedButton(
                  onPressed: () => reloadProfileData(),
                  child: Text('Retry'),
                ),
              ],
            );
          }
        }),
      ),
    ));
  }
}
