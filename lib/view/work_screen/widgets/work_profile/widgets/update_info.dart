import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app_controller.dart';
import '../../../../../controllers/dr_controller.dart';

class UpdateInfoPage extends StatefulWidget {
  final String consultationFees;
  final String followUpFees;

  UpdateInfoPage({required this.consultationFees, required this.followUpFees});

  @override
  _UpdateInfoPageState createState() => _UpdateInfoPageState();
}

class _UpdateInfoPageState extends State<UpdateInfoPage> {
  TextEditingController consultationFee= TextEditingController();
  TextEditingController followUpFee= TextEditingController();

  @override
  void initState() {
    super.initState();
    // consultationFee =
    //     TextEditingController(text: widget.consultationFees.toString());
    // followUpFee =
    //     TextEditingController(text: widget.followUpFees.toString());
  }

  @override
  void dispose() {
    consultationFee?.dispose();
    followUpFee?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title:   Text('Create Fees') ,
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
                        'Consultation Fees',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        height: 41,
                        child: TextFormField(
                          controller: consultationFee,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter consultation fees',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Follow-Up Fees',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        height: 41,
                        child: TextFormField(
                          controller: followUpFee,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter follow-up fees',
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

                              await drController.updateDoctorInformation(
                                  context,
                                  consultationFee: consultationFee!.text,
                                  followUpFee: followUpFee!.text).then((value) => drController.fetchDoctorProfile());







                          } catch (e) {
                            print('Error updating doctor information: $e');
                          }
                        },
                        child:  Text('Create') ,
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
