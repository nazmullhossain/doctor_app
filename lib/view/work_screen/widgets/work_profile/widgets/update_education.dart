import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app_controller.dart';
import '../../../../../controllers/dr_controller.dart';

class UpdateEducation extends StatefulWidget {
  final String instituteName;
  final String passing_year,degree;
  final int eduId;

  UpdateEducation({required this.instituteName,required this.passing_year, required this.degree, required this.eduId});

  @override
  _UpdateEducationState createState() => _UpdateEducationState();
}

class _UpdateEducationState extends State<UpdateEducation> {
  TextEditingController? instituteName;
  TextEditingController? degree;
  TextEditingController? passing_year;

  @override
  void initState() {
    super.initState();
    instituteName =
        TextEditingController(text: widget.instituteName.toString());
  passing_year =
        TextEditingController(text: widget.passing_year.toString());
   degree =
        TextEditingController(text: widget.degree.toString());
  }

  @override
  void dispose() {
    instituteName?.dispose();
    passing_year?.dispose();
    degree?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('Update Education'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey),
                height: 25,
                width: 25,
                child: const Icon(
                  Icons.navigate_before,
                  color: Colors.black,
                ))),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Education Info',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        controller: instituteName,
                        decoration: InputDecoration(
                          hintText: 'Institute Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Degree',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        controller:degree,
                        decoration: InputDecoration(
                          hintText: 'Degree',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        height: 41,
                        child: TextFormField(
                          controller:passing_year,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Passing Year',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.cyanAccent,
                            foregroundColor: Colors.black
                        ),
                        onPressed: ()async{
                          final DrController drController = Get.find();
                          try {
                            await drController.updateEducation(context,degree: degree!.text,institute_name: instituteName?.text,passing_year: passing_year?.text,education_id: widget.eduId
                           ).then((value) => drController.fetchDoctorProfile());


                          } catch (e) {
                            print('Error updating doctor information: $e');
                          }
                        },
                        child: Text('Update'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
