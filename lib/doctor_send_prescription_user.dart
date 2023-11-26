

import 'dart:convert';

import 'package:doctor_app/global_widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/app_controller.dart';

class DoctorSendPrescriptionUser extends StatefulWidget {
  final String? id;
  final String? fullName;
  final String? weight;
  final String? address;
  final String? age;
  final String? sex;
  final String? reason;
  final String? aUserId;

  const DoctorSendPrescriptionUser({super.key, this.id, this.fullName, this.weight, this.address, this.age, this.sex, this.reason, this.aUserId});

  @override
  State<DoctorSendPrescriptionUser> createState() =>
      _DoctorSendPrescriptionUserState();
}

class _DoctorSendPrescriptionUserState
    extends State<DoctorSendPrescriptionUser> {
  final _medicinesController = TextEditingController();
  final _rulesController = TextEditingController();
  final _timesController = TextEditingController();
  List<Medication> medications = []; // List to hold medication information
  // final GlobalKey<_DoctorSendPrescriptionUserState> _key =
  // GlobalKey<_DoctorSendPrescriptionUserState>();
  bool loader = false;
  @override
  void initState() {
    super.initState();
    // Initialize with three empty medication fields
    medications = List.generate(1, (index) => Medication());
  }

  void removeMedication(int index) {
    if (index > 0) {
      setState(() {
        medications.removeAt(index);
      });
    }
  }

  Future<void> makePrescription() async {
    setState(() {
      loader = true;
    });

    // Concatenate values from all medication input fields with commas
    String medicines = medications
        .map((medication) => medication.medicineController.text)
        .join(',');
    String rules =
    medications.map((medication) => medication.rulesController.text).join(',');
    String times =
    medications.map((medication) => medication.timesController.text).join(',');

    final AppController appController = Get.find();
    final pref = await SharedPreferences.getInstance();
    const apiUrl = 'https://www.treatmenticwl.com/api/doctor/prescription/generate';
    var header = {'Authorization': 'Bearer ${appController.token}'};
    var body = {
      'appointment_id': "${widget.id}",
      'patient_name': "${widget.fullName}",
      'weight': "50",
      'patient_address': "Dhaka Bangladesh",
      'patient_age': "30",
      'patient_sex': "Male",
      'main_reason': "Pain",
      'medicines': "$medicines",
      'rules': "$rules",
      'times': "$times",
    };
  print('body---${body}');
    final response = await http.post(Uri.parse(apiUrl), body: body, headers: header);
    if (response.statusCode == 200) {
      print('Success');
      print("Response: ${response.body}");

      Fluttertoast.showToast(
        msg: "Prescription Sent Successfully.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 18.0,
      );
      Get.offAll(CustomBottomBar());
      setState(() {
        loader = false;
      });
    } else {
      final decode = jsonDecode(response.body);
      setState(() {
        loader = false;
      });
      print("Response: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ID__${widget.id}");
    print("ID__${widget.fullName}");
    return Scaffold(
      bottomNavigationBar: loader ? Center(
        child: CircularProgressIndicator(),
      ) :  GestureDetector(
        onTap: () {
          // Check if any field is empty
          if (medications.any((medication) =>
          medication.medicineController.text.isEmpty ||
              medication.rulesController.text.isEmpty ||
              medication.timesController.text.isEmpty)) {
            // Show a Snackbar if any field is empty
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please fill in all medication fields.'),
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            // All fields are filled, proceed with making a prescription
          makePrescription(
            );
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          color: Colors.indigo,
          child: Text(
            "Submit",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Make Prescription"),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < medications.length; i++)
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: MedicationInputField(
                    medicineController: medications[i].medicineController,
                    rulesController: medications[i].rulesController,
                    timesController: medications[i].timesController,
                    onRemove: () {
                      removeMedication(i); // Remove the field at index i
                    },
                  ),
                ),

              // "Add more" button
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.indigo),
                      onPressed: () {
                        // Add three more medication fields when the button is clicked
                        setState(() {
                          medications.addAll(List.generate(1, (index) => Medication()));
                        });
                      },
                      child: const Text('Add more'),
                    ),
                  ],
                ),
              ),

              // ... (other code remains the same)
            ],
          ),
        ),
      ),
    );
  }
}

class Medication {
  TextEditingController medicineController = TextEditingController();
  TextEditingController rulesController = TextEditingController();
  TextEditingController timesController = TextEditingController();
}

class MedicationInputField extends StatefulWidget {
  final TextEditingController medicineController;
  final TextEditingController rulesController;
  final TextEditingController timesController;
  final VoidCallback onRemove; // Callback to remove the field

  MedicationInputField({
    Key? key,
    required this.medicineController,
    required this.rulesController,
    required this.timesController,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<MedicationInputField> createState() => _MedicationInputFieldState();
}

class _MedicationInputFieldState extends State<MedicationInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: widget.medicineController,
            decoration: InputDecoration(
              labelText: 'Medicine Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: widget.rulesController,
            decoration: InputDecoration(
              labelText: 'Rules',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: widget.timesController,
            decoration: InputDecoration(
              labelText: 'Times',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          // "Remove" button
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: widget.onRemove,
                child: const Text('Remove'),
              ),
            ],
          ),
        ],
      ),
    );
  }



}
