import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/app_controller.dart';
import '../../../../../controllers/dr_controller.dart';
import '../../../../../controllers/user_controller.dart';

class AddExperience extends StatelessWidget {


  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _workingPlaceController = TextEditingController();
  final TextEditingController _employmentStatusController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();
  final RxString selectedDepartmentId = ''.obs;


  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    final DrController drController = Get.find();
    final AppController appController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        elevation: 0,
        title: Text('Add Experience'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            height: 25,
            width: 25,
            child: const Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
          ),
        ),
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
                      TextFormField(
                        controller: _employmentStatusController,
                        decoration: InputDecoration(
                          hintText: 'Part-ime/Full-Time/Contractual',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
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
                            hintText: '31/10/20 -- 01/10/23',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Dropdown for departments
                      Text(
                        'Department',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),

                      SizedBox(
                        height: 70,
                        child: DropdownButtonFormField<String>(
                          value: selectedDepartmentId.value,
                          onChanged: (String? newValue) {
                            selectedDepartmentId.value = newValue ?? '';
                          },
                          items: [

                            DropdownMenuItem<String>(
                              value: '',
                              child: Text('Choose Department'),
                            ),

                            ...userController.departments.map(
                                  (department) => DropdownMenuItem<String>(
                                value: department.id.toString(),
                                child: Text(department.name),
                              ),
                            ).toList(),
                          ],
                          decoration: InputDecoration(
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
                        onPressed: () async {
                          await drController.addExperience(
                            _designationController.text,
                            selectedDepartmentId.value,
                            _employmentStatusController.text,
                            _periodController.text,
                            _workingPlaceController.text,
                            context,
                          );
                          drController.fetchDoctorProfile();
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
