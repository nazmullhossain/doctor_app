// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controllers/app_controller.dart';
// import '../../../model/doctor_model.dart';
//
//
// class UpdateFees extends StatefulWidget {
//   final DoctorInfo doctorInfo;
//
//   const UpdateFees({Key? key, required this.doctorInfo}) : super(key: key);
//
//   @override
//   State<UpdateFees> createState() => _UpdateFeesState();
// }
//
// class _UpdateFeesState extends State<UpdateFees> {
//   @override
//   Widget build(BuildContext context) {
//     final AppController appController = Get.find();
//
//     TextEditingController consultationFee =
//         TextEditingController(text: widget.doctorInfo.consultationFee);
//     TextEditingController followupFee =
//         TextEditingController(text: widget.doctorInfo.followUpFee);
//
//
//     return SafeArea(
//       child: Scaffold(
//         body:  Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//
//                 Container(
//                   color: Colors.blue,
//                   height: 45,
//                   width: MediaQuery.of(context).size.width,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(onPressed: (){
//                         Navigator.pop(context,true);}, icon: const Icon(Icons.navigate_before)),
//                       const Text(
//                         "Update Fees",
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Consultation fee",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   SizedBox(
//                     height: 35,
//                     child: TextFormField(
//                       controller: consultationFee,
//                       decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.only(top: 4),
//                           prefixIcon: const Icon(Icons.circle_outlined),
//                           hintText: "Consultation fee",
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5),
//                               borderSide: const BorderSide()),
//                           focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide())),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12.0,
//                   ),
//                   const Text("Followup Fee",
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   SizedBox(
//                     height: 35,
//                     child: TextFormField(
//                       controller: followupFee,
//                       decoration: InputDecoration(
//                           hintText: "Followup Fee",
//                           contentPadding: const EdgeInsets.only(top: 4),
//                           prefixIcon: const Icon(Icons.circle_outlined),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5),
//                               borderSide: const BorderSide()),
//                           focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide())),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12.0,
//                   ),
//                   Center(
//                       child: ElevatedButton(
//                           onPressed: ()async{
//                             try {
//                               await appController.updateDoctorInformation(
//                                 context,
//                                   token: appController.token!,
//                                   consultationFee: consultationFee.text,
//                                   followUpFee: followupFee.text).then((value) => appController.fetchDoctorProfile(appController.token!, context));
//
//
//                             } catch (e) {
//                               print('Error updating doctor information: $e');
//                             }
//                           },
//                           child: const Text("Update Fees"))),
//                 ],
//               ),
//             )
//           ],
//         ),
//     )
//     );
//   }
// }
