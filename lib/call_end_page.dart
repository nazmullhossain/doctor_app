// import 'dart:convert';
//
// import 'package:doctor_app/controllers/app_controller.dart';
// import 'package:doctor_app/view/doctor_home/doctor_home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CallEndPage extends StatefulWidget {
//   final String? id;
//   final String? fullName;
//   final String? weight;
//   final String? address;
//   final String? age;
//   final String? sex;
//   final String? reason;
//   final String? aUserId;
//
//   const CallEndPage(
//       {super.key,
//       this.id,
//       this.fullName,
//       this.weight,
//       this.address,
//       this.age,
//       this.sex,
//       this.reason,
//       this.aUserId});
//
//   @override
//   State<CallEndPage> createState() => _CallEndPageState();
// }
//
// class _CallEndPageState extends State<CallEndPage> {
//   final _medicinesController = TextEditingController();
//   final _rulesController = TextEditingController();
//   final _timesController = TextEditingController();
//   bool loader = false;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     print("IDDD_${id}");
//     print("name${fullName}");
//     print("weight${weight}");
//     print("age${age}");
//     print("auserId${aUserId}");
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Make Test Report / Prescription"),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   TextFormField(
//                     controller: _medicinesController ,
//                     maxLines: 25,
//                     decoration: InputDecoration(
//                      // labelText: 'Medicine Name',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   // TextFormField(
//                   //   controller: _rulesController,
//                   //   maxLines: 3,
//                   //   decoration: InputDecoration(
//                   //   //  labelText: 'Rules',
//                   //     border: OutlineInputBorder(
//                   //       borderRadius: BorderRadius.circular(10.0),
//                   //     ),
//                   //   ),
//                   // ),
//                   // const SizedBox(
//                   //   height: 20,
//                   // ),
//                   // TextFormField(
//                   //   controller: _timesController,
//                   //   maxLines: 3,
//                   //   decoration: InputDecoration(
//                   //   //  labelText: 'Times',
//                   //     border: OutlineInputBorder(
//                   //       borderRadius: BorderRadius.circular(10.0),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//               loader
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.cyan,
//                         ),
//                         onPressed: () async {
//                           final pref = await SharedPreferences.getInstance();
//                           if (_medicinesController.text.isEmpty) {
//                             _showSnackbar('Please make a prescription');
//                           } else {
//                             makePrescription(
//                               medicines: _medicinesController.text,
//                               rules: _medicinesController.text,
//                               times: _medicinesController.text,
//                             );
//                             // pref.remove('ap_id');
//                             // pref.remove('pst_name');
//                             // pref.remove('weight');
//                             // pref.remove('address');
//                             // pref.remove('age');
//                             // pref.remove('sex');
//                             // pref.remove('reason');
//                             // pref.remove('aUser_id');
//                             // Get.offAll(DoctorHome());
//                           }
//                         },
//                         child: const Text('Send Prescription'),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:doctor_app/global_widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/app_controller.dart';

class CallEndPage extends StatefulWidget {
  final String? id;
  final String? fullName;
  final String? weight;
  final String? address;
  final String? age;
  final String? sex;
  final String? reason;
  final String? aUserId;

  const CallEndPage(
      {super.key,
      this.id,
      this.fullName,
      this.weight,
      this.address,
      this.age,
      this.sex,
      this.reason,
      this.aUserId});

  @override
  State<CallEndPage> createState() => _CallEndPageState();
}

class _CallEndPageState extends State<CallEndPage> {
  final _medicinesController = TextEditingController();
  final _rulesController = TextEditingController();
  final _timesController = TextEditingController();
  List<Medication> medications = []; // List to hold medication information
  // final GlobalKey<_DoctorSendPrescriptionUserState> _key =
  // GlobalKey<_DoctorSendPrescriptionUserState>();
  bool loader = false;

  String? id;
  String? fullName;
  String? weight;
  String? address;
  String? age;
  String? sex;
  String? reason;
  String? aUserId;
  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('ap_id');
    fullName = pref.getString('pst_name');
    weight = pref.getString('weight');
    address = pref.getString('address');
    age = pref.getString('age');
    sex = pref.getString('sex');
    reason = pref.getString('reason');

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
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
    String rules = medications
        .map((medication) => medication.rulesController.text)
        .join(',');
    String times = medications
        .map((medication) => medication.timesController.text)
        .join(',');

    final AppController appController = Get.find();
    final pref = await SharedPreferences.getInstance();
    const apiUrl =
        'https://www.treatmenticwl.com/api/doctor/prescription/generate';
    var header = {'Authorization': 'Bearer ${appController.token}'};
    var body = {
      'appointment_id': id,
      'patient_name': "$fullName",
      'weight': "$weight",
      'patient_address': "$address",
      'patient_age': "${age}",
      'patient_sex': "$sex",
      'main_reason': "$reason",
      'medicines': "$medicines",
      'rules': "$rules",
      'times': "$times",
    };
    log('body---${body}');
    final response =
        await http.post(Uri.parse(apiUrl), body: body, headers: header);
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
      markCompleteCall();
      Get.offAll(CustomBottomBar());
      setState(() {
        loader = false;
      });
      pref.remove('ap_id');
      pref.remove('pst_name');
      pref.remove('weight');
      pref.remove('address');
      pref.remove('age');
      pref.remove('sex');
      pref.remove('reason');

    } else {
      final decode = jsonDecode(response.body);
      setState(() {
        loader = false;
      });
      print("Response: ${response.body}");
    }
  }

  Future markCompleteCall() async {
    final AppController appController = Get.put(AppController());

    String? token = appController.token;
    final pref = await SharedPreferences.getInstance();
    final id = await pref.getString('ap_id');
    var headers = {'Authorization': 'Bearer ${token}'};
    var response = await http.post(
      Uri.parse(
          "https://www.treatmenticwl.com/api/doctor/mark/complete/video-call"),
      headers: headers,
      body: {"appointment_id": "${id}"},
    );
    print("OOOOOo   ----${id}");
    if (response.statusCode == 200) {
      print("RESSCOMPL___${response.body}");
    } else {
      print("RESSCOMPL___${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ID__${widget.id}");
    print("ID__${widget.fullName}");
    return Scaffold(
      bottomNavigationBar: loader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GestureDetector(
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
                  makePrescription();
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
        title: Text("Make Test Report / Prescription"),
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
                          medications.addAll(
                              List.generate(1, (index) => Medication()));
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
