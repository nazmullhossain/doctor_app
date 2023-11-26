import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/add_education.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/update_department.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/update_education.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/update_experience.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/update_info.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/update_service_time.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/update_symptoms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/app_controller.dart';
import '../../../../../controllers/dr_controller.dart';
import '../../../../../controllers/user_controller.dart';
import '../../../../../global_widgets/custom_card.dart';
import '../../../../../update_newScreen.dart';
import 'add_experience.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final DrController drController = Get.find();
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const Text(
          "Basic Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: CustomCard(
            column: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Service Time",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => UpdateServiceTime(
                                instantCall: drController.doctorProfile.value
                                        ?.data!.instantCall.toString() ??
                                    '',
                                appointment: drController.doctorProfile.value
                                        ?.data!.appointment.toString() ??
                                    '',
                              ));
                        },
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Available for Online Appointment',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(drController.doctorProfile.value?.data
                                          ?.startDayForSchedule ??
                                      ''),
                                  Text(' -- '),
                                  Text(drController.doctorProfile.value!.data!
                                          .endDayForSchedule ??
                                      '')
                                ],
                              ),
                              Row(
                                children: [
                                  Text(drController.doctorProfile.value?.data
                                          ?.startTimeForSchedule ??
                                      ''),
                                  Text(' -- '),
                                  Text(drController.doctorProfile.value?.data
                                          ?.endTimeForSchedule ??
                                      '')
                                ],
                              )
                            ],
                          ),
                        SizedBox(
                          height: 6,
                        ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Instant Consultation',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(drController.doctorProfile.value?.data!
                                          .startDayForInstant ??
                                      ''),
                                  Text(' -- '),
                                  Text(drController.doctorProfile.value?.data!
                                          .endDayForInstant ??
                                      ''),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(drController.doctorProfile.value?.data
                                          ?.startTimeForInstant ??
                                      ''),
                                  Text(' -- '),
                                  Text(drController.doctorProfile.value!.data!
                                          .endTimeForInstant ??
                                      ''),
                                ],
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Fees",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => UpdateNewInfoPage(
                            consultationFees: drController.doctorProfile
                                .value!.data!.info?.consultationFee.toString() ?? '',
                            followUpFees: drController.doctorProfile.value!
                                .data!.info?.followUpFee.toString() ?? '',
                          ));
                        },
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 25,
                          width: 25,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => UpdateInfoPage(
                                consultationFees: drController.doctorProfile
                                    .value!.data!.info?.consultationFee.toString() ?? '',
                                followUpFees: drController.doctorProfile.value!
                                    .data!.info?.followUpFee.toString() ?? '',
                              ));
                        },
                        child: Icon(Icons.add_box,size: 40,)
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Consultation fee",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Obx(
                            () => Text(
                                "৳ ${drController.doctorProfile.value?.data!.info?.consultationFee ?? 'Not set yet'}"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Follow-up fee",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Obx(
                            () => Text(
                                "৳ ${drController.doctorProfile.value?.data?.info?.followUpFee ?? 'Not set yet'}"),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: CustomCard(
            column: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Speciality",
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        final symptomIds =
                            drController.doctorProfile.value?.data!.symptoms!
                                .map((symptom) => symptom.id)
                                .whereType<int>()
                                .toList();
                        appController.selectedSymptoms
                            .assignAll(symptomIds ?? []);
                        Get.to(() => UpdateDrSymptoms(
                              symptomIds: symptomIds ?? [],
                            ));
                      },
                      child: Image.asset(
                        "assets/images/edit.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        children: List<Widget>.generate(
                          drController.doctorProfile.value?.data?.symptoms
                                  ?.length ??
                              0,
                          (index) {
                            final symptom = drController
                                .doctorProfile.value?.data!.symptoms![index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      symptom?.name ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: CustomCard(
            column: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Departments",
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        final deptIds = drController
                            .doctorProfile.value?.data!.departments!
                            .map((dept) => dept.id)
                            .whereType<int>()
                            .toList();
                        appController.selectedDepartments
                            .assignAll(deptIds ?? []);
                        Get.to(() => UpdateDrDepartment(
                              departmentIds: deptIds ?? [],
                            ));
                      },
                      child: Image.asset(
                        "assets/images/edit.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Column(
                        children: List<Widget>.generate(
                          drController
                              .doctorProfile.value!.data!.departments!.length,
                          (index) {
                            final department = drController
                                .doctorProfile.value?.data!.departments![index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      department?.name ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        const Text(
          "My Work Experience",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: CustomCard(
            column: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Experience",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => AddExperience()),
                      child: Icon(Icons.add_box, size: 30),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: drController
                          .doctorProfile.value?.data!.experience?.length,
                      itemBuilder: (context, index) {
                        final experience = drController
                            .doctorProfile.value?.data!.experience?[index];
                        if (experience == null) return Container();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => UpdateExperience(
                                          designation: experience.designation!,
                                          departmentId:
                                              experience.id.toString(),
                                          workingPlace:
                                              experience.workingPlace!,
                                          employmentStatus:
                                              experience.employmentStatus!,
                                          period: experience.period!,
                                          experience_id: experience.id!,
                                        ));
                                  },
                                  child: Image.asset(
                                    "assets/images/edit.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    print(experience.id);
                                    await drController
                                        .deleteExperience(
                                            experience.id!, context)
                                        .then((value) =>
                                            drController.fetchDoctorProfile());
                                  },
                                  child: Icon(
                                    Icons.delete_sweep_outlined,
                                    size: 28,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Designation",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(experience.designation!),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Working Place",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(experience.workingPlace!),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Emp. Status",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(experience.employmentStatus!),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Period",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(experience.period!),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Education & Certification",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomCard(
          column: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Education",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => AddEducation()),
                    child: Icon(Icons.add_box, size: 30),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              drController.doctorProfile.value?.data?.educations?.length == 0
                  ? Container()
                  :Obx(() =>  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: drController
                          .doctorProfile.value?.data?.educations!.length,
                      itemBuilder: (context, index) {
                        final education = drController
                            .doctorProfile.value!.data!.educations![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => UpdateEducation(
                                        instituteName: education.instituteName!,
                                        passing_year: education.passingYear!.toString(),
                                        degree: education.degree!, eduId: education.id!,));
                                  },
                                  child: Image.asset(
                                    'assets/images/edit.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () async{
                                     drController.deleteEducation(
                                        education.id!, context).then((value) => drController.fetchDoctorProfile());
                                  },
                                  child: Icon(
                                    Icons.delete_sweep_outlined,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                            ListTile(title: Text(education.instituteName!,style: TextStyle(overflow: TextOverflow.ellipsis),),subtitle:  Text(education.degree!,style: TextStyle(overflow: TextOverflow.ellipsis)),trailing: Text("${education.passingYear?? 0}",style: TextStyle(overflow: TextOverflow.ellipsis)) ,)


                          ],
                        );
                      },
                    ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
