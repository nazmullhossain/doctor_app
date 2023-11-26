import 'package:doctor_app/view/doctor_screen/widgets/short_doctors_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/user_controller.dart';
import '../../../model/all_doctors.dart';
import '../../../model/doctor_model.dart';

import 'doctor_overview.dart';

class InstantConsultingDoctor extends StatefulWidget {
  final List<DoctorsData> doctors;

  const InstantConsultingDoctor({Key? key, required this.doctors})
      : super(key: key);

  @override
  State<InstantConsultingDoctor> createState() =>
      _InstantConsultingDoctorState();
}

class _InstantConsultingDoctorState extends State<InstantConsultingDoctor> {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    reloadData() async {
      await userController.fetchAvailableDoctors();
    }

    return Obx(() {
      if (userController.isAvailableDrLoading.value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      } else if (userController.availableDoctors.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Data'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () => reloadData(),
              child: Text('Retry'),
            ),
          ],
        );
      } else {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: widget.doctors
                  .map(
                    (item) => InkWell(
                      onTap: () {
                      Get.to(()=>  DoctorOverview(
                                      doctorFee: item.info?.consultationFee.toString() ??'Not fixed yet',
                                      doctorName: item.name!,
                                      doctorID: item.id.toString(),
                                    ));
                      },
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                                padding: const EdgeInsets.all(24),
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: item.profilePhotoUrl!.isNotEmpty
                                        ? Image.network(item.profilePhotoUrl!)
                                        : Image.asset(
                                            'assets/images/stetho.png',
                                            height: 25,
                                            width: 25,
                                          ))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.video_call,
                                size: 20,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(item.name!,
                                  style: const TextStyle(fontSize: 10)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList()),
        );
      }
    });
  }
}
