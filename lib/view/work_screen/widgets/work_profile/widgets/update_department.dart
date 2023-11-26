import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api_services/doctor_service.dart';
import '../../../../../controllers/dr_controller.dart';
import '../../../../../controllers/user_controller.dart';

class UpdateDrDepartment extends StatefulWidget {
  final List<int> departmentIds;
  UpdateDrDepartment({Key? key, required this.departmentIds}) : super(key: key);

  @override
  State<UpdateDrDepartment> createState() => _UpdateDrDepartmentState();
}

class _UpdateDrDepartmentState extends State<UpdateDrDepartment> {
  final appController = Get.find<AppController>();
  final userController = Get.find<UserController>();
  final drController = Get.find<DrController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        leading: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.navigate_before)),
        title: Text('Update Departments'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: userController.departments.length,
                itemBuilder: (context, index) {
                  final department = userController.departments[index];

                  return GestureDetector(
                    onTap: () {
                      appController.toggleDepartmentSelection(department.id);
                    },
                    child: Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Obx(
                            () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: appController.selectedDepartments
                                .contains(department.id)
                                ? Colors.blue
                                : Colors.black,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                               department.name,
                                style: TextStyle(
                                  color: appController.selectedDepartments
                                      .contains(department.id)
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 10),
                              appController.selectedDepartments
                                  .contains(department.id)
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
             String selectedDepts =  appController.selectedDepartments.map((id) =>id.toString() ).join(',');
               await drController.setDepartment(selectedDepts,context).then((value) =>drController.fetchDoctorProfile() );

            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}
