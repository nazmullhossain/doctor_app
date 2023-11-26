import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/view/doctor_screen/widgets/doctors_by_category/dr_by_symptom.dart';
import 'package:doctor_app/view/doctor_screen/widgets/type_wise_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/user_controller.dart';
import 'dr_card.dart';

class SymptomsCategory extends StatefulWidget {
  const SymptomsCategory({super.key});

  @override
  State<SymptomsCategory> createState() => _SymptomsCategoryState();
}

class _SymptomsCategoryState extends State<SymptomsCategory> {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    Future<void> reloadSymptomData() async {
      await userController.getAllSymptoms();
    }

    return Obx(() {
      if (userController.isSymptomsLoading.value) {
        return const Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ));
      } else if (userController.symptoms.isNotEmpty) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisExtent: 124),
            itemCount: userController.symptoms.length,
            itemBuilder: (context, index) {
              final symptom = userController.symptoms[index];
              return InkWell(
                onTap: () {
                  Get.to(() => DoctorsBySymptomScreen(symptomId: symptom.id));
                },
                child: DrCard(image: symptom.icon, title: symptom.name),
              );
            },
          ))
        ]);
      } else {
        return Column(
          children: [
            Text('Failed to fetch symptoms'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () => reloadSymptomData(),
              child: Text('Retry'),
            ),
          ],
        );
      }
    });
  }
}
