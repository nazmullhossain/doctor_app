import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/dr_controller.dart';
import '../../../../../controllers/user_controller.dart';

class UpdateDrSymptoms extends StatefulWidget {
  final List<int> symptomIds;
  UpdateDrSymptoms({Key? key, required this.symptomIds}) : super(key: key);

  @override
  State<UpdateDrSymptoms> createState() => _UpdateDrSymptomsState();
}

class _UpdateDrSymptomsState extends State<UpdateDrSymptoms> {

  final appController = Get.find<AppController>();
  final userController = Get.find<UserController>();
  final drController = Get.find<DrController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.navigate_before)),
        backgroundColor: Colors.cyanAccent,
        title: Text('Update Symptoms'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: userController.symptoms.length,
                itemBuilder: (context, index) {
                  final symptom = userController.symptoms[index];

                  return GestureDetector(
                    onTap: () {
                      appController.toggleSymptomSelection(symptom.id);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: appController.selectedSymptoms
                                    .contains(symptom.id)
                                ? Colors.blue
                                : Colors.black,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                symptom.name,
                                style: TextStyle(
                                  color: appController.selectedSymptoms
                                          .contains(symptom.id)
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 10),
                              appController.selectedSymptoms
                                      .contains(symptom.id)
                                  ? Icon(Icons.check, color: Colors.white)
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.cyanAccent,
                foregroundColor: Colors.black
            ),
            onPressed: () async{
              String selectedSymptoms =  appController.selectedSymptoms.map((id) =>id.toString() ).join(',');
              await drController.setSymptom( selectedSymptoms,context).then((value) => drController.fetchDoctorProfile());
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}
