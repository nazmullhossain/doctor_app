import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/view/doctor_screen/widgets/doctors_by_category/doctors_by_dept.dart';
import 'package:doctor_app/view/doctor_screen/widgets/type_wise_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_controller.dart';
import 'dr_card.dart';

class Departments extends StatefulWidget {
  const Departments({Key? key}) : super(key: key);

  @override
  State<Departments> createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  @override

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    Future<void> reloadDeptData() async {
      userController.fetchDepartments();
    }
    return Obx(
      () {
        if (userController.isDeptLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if(userController.departments.isNotEmpty){
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, mainAxisExtent: 124),
                      itemCount: userController.departments.length,
                      itemBuilder: (context, index) {
                        final department = userController.departments[index];
                        return InkWell(
                          onTap: (){
                           Get.to(()=>DoctorsByDepartmentScreen(deptId: department.id));
                          },
                          child: DrCard(
                              image: department.icon, title: department.name),
                        );
                      },
                    ))
              ]);
        }
        else{
          return Column(
            children: [
              Text('Failed to fetch departments'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () => reloadDeptData(),
                child: Text('Retry'),
              ),
            ],
          );
        }
      },
    );
  }
}
