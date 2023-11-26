// 01835018001
// 123456
//
//
// //
// // class DoctorSendPrescriptionUser extends StatefulWidget {
// //   final String? id;
// //   final String? fullName;
// //   final String? weight;
// //   final String? address;
// //   final String? age;
// //   final String? sex;
// //   final String? reason;
// //   final String? aUserId;
// //
// //   const DoctorSendPrescriptionUser(
// //       {super.key,
// //         this.id,
// //         this.fullName,
// //         this.weight,
// //         this.address,
// //         this.age,
// //         this.sex,
// //         this.reason,
// //         this.aUserId});
// //
// //   @override
// //   State<DoctorSendPrescriptionUser> createState() => _DoctorSendPrescriptionUserState();
// // }
// //
// // class _DoctorSendPrescriptionUserState extends State<DoctorSendPrescriptionUser> {
// //   final _medicinesController = TextEditingController();
// //   final _rulesController = TextEditingController();
// //   final _timesController = TextEditingController();
// //   bool loader = false;
// //
// //   // String? id;
// //   // String? fullName;
// //   // String? weight;
// //   // String? address;
// //   // String? age;
// //   // String? sex;
// //   // String? reason;
// //   // String? aUserId;
// //   // getData() async {
// //   //   SharedPreferences pref = await SharedPreferences.getInstance();
// //   //   id = pref.getString('ap_id');
// //   //   fullName = pref.getString('pst_name');
// //   //   weight = pref.getString('weight');
// //   //   address = pref.getString('address');
// //   //   age = pref.getString('age');
// //   //   sex = pref.getString('sex');
// //   //   reason = pref.getString('reason');
// //   //   aUserId = pref.getString('aUser_id');
// //   //
// //   //   setState(() {});
// //   // }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// //     //   getData();
// //     // });
// //
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     // print("IDDD_${id}");
// //     // print("name${fullName}");
// //     // print("weight${weight}");
// //     // print("age${age}");
// //     // print("auserId${aUserId}");
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Make Prescription"),
// //         elevation: 1,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Container(
// //                 padding: EdgeInsets.all(11),
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey[300],
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     TextFormField(
// //                       controller: _medicinesController ,
// //
// //                       decoration: InputDecoration(
// //                         labelText: 'Medicine Name',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10.0),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     TextFormField(
// //                       controller: _rulesController,
// //                       // maxLines: 3,
// //                       decoration: InputDecoration(
// //                        labelText: 'Rules',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10.0),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 20,
// //                     ),
// //                     TextFormField(
// //                       controller: _timesController,
// //                       // maxLines: 3,
// //                       decoration: InputDecoration(
// //                        labelText: 'Times',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10.0),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               // loader
// //               //     ? Center(
// //               //   child: CircularProgressIndicator(),
// //               // )
// //               //     : SizedBox(
// //               //   width: MediaQuery.of(context).size.width,
// //               //   child: ElevatedButton(
// //               //     style: ElevatedButton.styleFrom(
// //               //       backgroundColor: Colors.cyan,
// //               //     ),
// //               //     onPressed: () async {
// //               //       final pref = await SharedPreferences.getInstance();
// //               //       if (_medicinesController.text.isEmpty) {
// //               //         _showSnackbar('Please make a prescription');
// //               //       } else {
// //               //         makePrescription(
// //               //           medicines: _medicinesController.text,
// //               //           rules: _medicinesController.text,
// //               //           times: _medicinesController.text,
// //               //         );
// //               //         // pref.remove('ap_id');
// //               //         // pref.remove('pst_name');
// //               //         // pref.remove('weight');
// //               //         // pref.remove('address');
// //               //         // pref.remove('age');
// //               //         // pref.remove('sex');
// //               //         // pref.remove('reason');
// //               //         // pref.remove('aUser_id');
// //               //         // Get.offAll(DoctorHome());
// //               //       }
// //               //     },
// //               //     child: const Text('Send Prescription'),
// //               //   ),
// //               // ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Future markCompleteCall() async {
// //     final AppController appController = Get.put(AppController());
// //
// //     String? token = appController.token;
// //     // final pref = await SharedPreferences.getInstance();
// //     // final id = pref.getString('ap_id');
// //     var headers = {'Authorization': 'Bearer ${token}'};
// //     var response = await http.post(
// //       Uri.parse(
// //           "https://www.treatmenticwl.com/api/doctor/mark/complete/video-call"),
// //       headers: headers,
// //       body: {"appointment_id": "${widget.id}"},
// //     );
// //     print("OOOOOo   ----${widget.id}");
// //     if (response.statusCode == 200) {
// //       print("RESSCOMPL___${response.body}");
// //
// //     } else {
// //       print("RESSCOMPL___${response.body}");
// //     }
// //   }
// //
// //   // Future markCompleteCall() async {
// //   //   final AppController appController = Get.put(AppController());
// //   //
// //   //   String? token = appController.token;
// //   //   final pref = await SharedPreferences.getInstance();
// //   //   final id = pref.getString('ap_id');
// //   //   var headers = {'Authorization': 'Bearer ${token}'};
// //   //   var request = http.MultipartRequest(
// //   //       'POST',
// //   //       Uri.parse(
// //   //           'https://www.treatmenticwl.com/api/doctor/mark/complete/video-call'));
// //   //   request.fields.addAll({'appointment_id': '${id}'});
// //   //
// //   //   request.headers.addAll(headers);
// //   //
// //   //   http.StreamedResponse response = await request.send();
// //   //
// //   //   if (response.statusCode == 200) {
// //   //     print("Iddddddjjj${id}");
// //   //     print("OKKKK__${response.reasonPhrase}");
// //   //     // print(await response.stream.bytesToString());
// //   //   } else {
// //   //     print(response.reasonPhrase);
// //   //   }
// //   // }
// //   Future makePrescription({
// //     required String medicines,
// //     required String rules,
// //     required String times,
// //   }) async {
// //     setState(() {
// //       loader = true;
// //     });
// //     final AppController appController = Get.find();
// //     final pref = await SharedPreferences.getInstance();
// //     // final id = pref.getString('ap_id');
// //     // final name = pref.getString('pst_name');
// //     // final weight = pref.getString('weight');
// //     // final address = pref.getString('address');
// //     // final age = pref.getString('age');
// //     // final sex = pref.getString('sex');
// //     // final reason = pref.getString('reason');
// //     // final userID = pref.getString('aUser_id');
// //     const apiUrl =
// //         'https://www.treatmenticwl.com/api/doctor/prescription/generate';
// //     var header = {'Authorization': 'Bearer ${appController.token}'};
// //     var body = {
// //       'appointment_id': "${widget.id}",
// //       'patient_name': "${widget.fullName}",
// //       'weight': "50",
// //       'patient_address': "Dhaka Bangladesh",
// //       'patient_age': "30",
// //       'patient_sex': "Male",
// //       'main_reason': "Pain",
// //       'medicines': "$medicines",
// //       'rules': "$rules",
// //       'times': "$times",
// //       // 'is_agent': '0',
// //       // 'target_id': userID.toString(),
// //     };
// //
// //     final response =
// //     await http.post(Uri.parse(apiUrl), body: body, headers: header);
// //     if (response.statusCode == 200) {
// //       print('SucessSucess');
// //       print("HHH__${response.body}");
// //
// //
// //       Fluttertoast.showToast(
// //           msg: "Prescription Sent Successfully.",
// //           toastLength: Toast.LENGTH_SHORT,
// //           gravity: ToastGravity.CENTER,
// //           timeInSecForIosWeb: 5,
// //           backgroundColor: Colors.green,
// //           textColor: Colors.white,
// //           fontSize: 18.0
// //       );
// //      // await markCompleteCall();
// //      //  pref.remove('ap_id');
// //      //  pref.remove('pst_name');
// //      //  pref.remove('weight');
// //      //  pref.remove('address');
// //      //  pref.remove('age');
// //      //  pref.remove('sex');
// //      //  pref.remove('reason');
// //      //  pref.remove('aUser_id');
// //       Get.offAll(DoctorHome());
// //       setState(() {
// //         loader = false;
// //       });
// //     } else {
// //       final decode = jsonDecode(response.body);
// //       setState(() {
// //         loader = false;
// //       });
// //       print("HHH__${response.body}");
// //     }
// //   }
// //
// //   void _showSnackbar(String message) => ScaffoldMessenger.of(context)
// //     ..hideCurrentSnackBar()
// //     ..showSnackBar(SnackBar(content: Text(message)));
// // }
