import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../global_widgets/custom_card.dart';
import '../../../../../model/all_doctors.dart';
import '../../../../model/doctor_model.dart';


class DoctorExperience extends StatelessWidget {
  final DoctorModel allDoctorsData;
  DoctorExperience({Key? key, required this.allDoctorsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomCard(
              column: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Experience",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  allDoctorsData.data!.experience != null ?
                  Expanded(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                        allDoctorsData.data!.experience?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("Designation"),
                                subtitle: Text(allDoctorsData.data!.experience![index].designation!),
                              ),
                              ListTile(
                                title: Text("Working Place"),
                                subtitle: Text(allDoctorsData.data!.experience![index].workingPlace!),
                              ),
                              ListTile(
                                title: Text("Emp. Status"),
                                subtitle: Text(allDoctorsData.data!.experience![index].employmentStatus!),
                              ),
                              // Expanded(
                              //   child: ListView.builder(itemBuilder: (context,index){
                              //
                              //     return Container(color: Colors.cyan,child: Text( appController.departments.where((
                              //   },itemCount: appController.departments.where((element) =>element.id==appController.doctorProfile.value!.data
                              //       .experience[index].departmentId ).length,),
                              // ),


                              ListTile(
                                title: Text("Period"),
                                subtitle: Text(allDoctorsData.data!.experience![index].period!),
                              ),
                            ],
                          );
                        }),):
                  Container()

                ],
              )),
        ),
      ],
    );
  }
}
