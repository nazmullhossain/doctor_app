import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/dr_controller.dart';

class UpdateExperience extends StatefulWidget {
  final String designation;
  final String departmentId;
  final String workingPlace;
  final String employmentStatus;
  final String period;
  final int experience_id;

  UpdateExperience({
    required this.designation,
    required this.departmentId,
    required this.workingPlace,
    required this.employmentStatus,
    required this.period, required this.experience_id,
  });

  @override
  _UpdateExperienceState createState() => _UpdateExperienceState();
}

class _UpdateExperienceState extends State<UpdateExperience> {
  TextEditingController? _designationController;
  TextEditingController? _workingPlaceController;
  TextEditingController? _employmentStatusController;
  TextEditingController? _periodController;

  @override
  void initState() {
    super.initState();
    _designationController = TextEditingController(text: widget.designation);
    _workingPlaceController = TextEditingController(text: widget.workingPlace);
    _employmentStatusController =
        TextEditingController(text: widget.employmentStatus);
    _periodController = TextEditingController(text: widget.period);
  }

  @override
  void dispose() {
    _designationController?.dispose();

    _workingPlaceController?.dispose();
    _employmentStatusController?.dispose();
    _periodController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        elevation: 0,
        title: Text('Update Experience'),
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
                        'Designation',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        maxLines: 2,
                        controller: _designationController,
                        decoration: InputDecoration(

                          hintText: 'Enter designation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.0),
                      Text(
                        'Working Place',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        maxLines: 2,
                        controller: _workingPlaceController,
                        decoration: InputDecoration(
                          hintText: 'Enter working place',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Employment Status',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        height: 41,
                        child: TextFormField(
                          controller: _employmentStatusController,
                          decoration: InputDecoration(
                            hintText: 'Enter employment status',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Period',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        height: 41,
                        child: TextFormField(
                          controller: _periodController,
                          decoration: InputDecoration(
                            hintText: 'Enter period',
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
                        onPressed: () async{

                          final DrController drController = Get.find();
                         await  drController.updateExperience( _designationController!.text, widget.departmentId, _employmentStatusController!.text, _periodController!.text, _workingPlaceController!.text,context,widget.experience_id).then((value) => drController.fetchDoctorProfile());

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
