import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app_controller.dart';
import '../../../../../controllers/dr_controller.dart';

class AddEducation extends StatefulWidget {

  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  TextEditingController? instituteName;
  TextEditingController? degree;
  TextEditingController? passing_year;

  @override
  void initState() {
    super.initState();
    instituteName =
        TextEditingController();
    passing_year =
        TextEditingController();
    degree =
        TextEditingController();
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
        title: Text('Add Education'),
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
                        'Institute',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        maxLines: 2,
                        controller: instituteName,
                        decoration: InputDecoration(
                          hintText: 'Institute Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'Degree',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        maxLines: 2,
                        controller:degree,
                        decoration: InputDecoration(
                          hintText: 'Degree',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        'Passing Year',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
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
                            await drController.addEducation(degree!.text,instituteName!.text,passing_year!.text,context).then((value) => drController.fetchDoctorProfile());


                          } catch (e) {
                            print('Error adding doctor information: $e');
                          }
                        },
                        child: Text('Add'),
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
