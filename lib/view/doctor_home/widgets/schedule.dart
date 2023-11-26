// import 'package:doctor_app/allApointment/model.dart';
// import 'package:doctor_app/controllers/app_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import '../../Schdule_details/schdule_details_screen.dart';
// import '../../consulting_screen/widget/consulting_card.dart';
// import '../../doctor_screen/widgets/bold_text.dart';
//
// class ScheduleScreen extends StatefulWidget {
//   const ScheduleScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ScheduleScreen> createState() => _ScheduleScreenState();
// }
//
// class _ScheduleScreenState extends State<ScheduleScreen> {
//   AllApointmentModel? allApointmentModel;
//   bool loader = false;
//   final AppController appController = Get.find<AppController>();
//
//   Future<AllApointmentModel?> getdata() async {
//     String? token = appController.token;
//     print("TOKNNNNN__${token}");
//     setState(() {
//       loader = true;
//     });
//     var response = await http.get(
//       Uri.parse("https://www.treatmenticwl.com/api/doctor/appointments"),
//       headers: {
//         'Authorization': 'Bearer $token',
//       },
//     );
//     if (response.statusCode == 200) {
//       setState(() {
//         print("Res__${response.body}");
//
//         allApointmentModel = allApointmentModelFromJson(response.body);
//         loader = false;
//       });
//     } else {
//       print("Res  e__${response.body}");
//     }
//     return allApointmentModel;
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     setState(() {
//       getdata();
//     });
//   }
//
//   final AppController controller = Get.put(AppController());
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     controller.singleInviteeUserIDTextCtrl.text = controller.id.value;
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             leading: InkWell(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Container(
//                     margin: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all()),
//                     child: const Icon(Icons.close))),
//             elevation: 0,
//             title: SizedBox(
//               height: 36,
//               width: MediaQuery.of(context).size.width - 100,
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   suffixIcon: const Icon(Icons.search),
//                 ),
//               ),
//             ),
//           ),
//           body: loader
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   shrinkWrap: true,
//                   primary: false,
//                   itemCount: allApointmentModel!.data!.length,
//                   itemBuilder: (_, index) {
//                     var data = allApointmentModel!.data![index];
//                     print("IM__${data.appointmentable!.profilePhotoUrl}");
//                     print("IM__${data.appointmentable!.profilePhotoUrl}");
//                     print("ffff${data.callAvailability}");
//                     if(data.isScheduled==1){
//                       return GestureDetector(
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (_) => AlertDialog(
//                                 contentPadding: EdgeInsets.zero,
//                                 content: Container(
//                                   height: size.height * .5,
//                                   padding: EdgeInsets.zero,
//                                   color: Colors.white,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(15.0),
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.center,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                             children: [
//                                               // BoldText(
//                                               //     text:
//                                               //     'User Details ${data.appointmentable!.id}'),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Container(
//                                             width: size.width * .9,
//                                             decoration: BoxDecoration(
//                                               color: Colors.green,
//                                               borderRadius:
//                                               BorderRadius.circular(15),
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 15,
//                                                   vertical: 10),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                                 children: [
//                                                   ListTile(
//                                                     contentPadding:
//                                                     EdgeInsets.zero,
//                                                     leading: CircleAvatar(
//                                                       backgroundColor:
//                                                       Colors.white,
//                                                       backgroundImage:
//                                                       AssetImage(
//                                                         'assets/images/profile-icon.png',
//                                                       ),
//                                                     ),
//                                                     title: Text(
//                                                       data.appointmentable!
//                                                           .name!,
//                                                       style: TextStyle(
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     'Email: ${data.appointmentable!.email}',
//                                                     style: TextStyle(
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     'Phone: ${data.appointmentable!.phone}',
//                                                     style: TextStyle(
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                             children: [
//                                               BoldText(
//                                                   text:
//                                                   'Consultation Details')
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           Container(
//                                             width: size.width * .9,
//                                             decoration: BoxDecoration(
//                                               color: Colors.green,
//                                               borderRadius:
//                                               BorderRadius.circular(15),
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 15,
//                                                   vertical: 10),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     'Patient Name: ${data.consultation!.fullName}',
//                                                     style: TextStyle(
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   // Text(
//                                                   //   'Age: ${DateFormat.yMMMd().format(DateTime.parse(data.consultation!.age!))}',
//                                                   //
//                                                   //   style: TextStyle(
//                                                   //     color: Colors.white,
//                                                   //   ),
//                                                   // ),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   Text(
//                                                     'Weight: ${data.consultation!.weight}',
//                                                     style: TextStyle(
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   Text(
//                                                     'Main Reason: ${data.consultation!.mainReason}',
//                                                     style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                         FontWeight.w700),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   Text(
//                                                     'Description: ${data.consultation!.descriptions}',
//                                                     style: TextStyle(
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 actions: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.end,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           Get.back();
//                                         },
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.red,
//                                               shape: BoxShape.circle),
//                                           child: Center(
//                                             child: Padding(
//                                               padding:
//                                               const EdgeInsets.all(10.0),
//                                               child: Icon(
//                                                 Icons.close,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       if (data.isScheduled ==1 && data.callAvailability == true) ...[
//                                         sendCallButton(
//                                           // dataSetter: dataSetter(userData!, index),
//                                             isVideoCall: true,
//                                             inviteeUsersIDTextCtrl: controller
//                                                 .singleInviteeUserIDTextCtrl,
//                                             onCallFinished:
//                                             onSendCallInvitationFinished,
//                                             //onSendCallInvitationFinished,
//                                             id: data.appointmentable!.id
//                                                 .toString(),
//                                             context: context),
//                                       ] else ...[
//                                         Container()
//                                       ],
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ));
//                           dataSetter(allApointmentModel!.data!, index);
//
//
//
//                           // Get.to(SchduleDetailsScreen());
//                         },
//                         child: ConsultingCard(
//                           name: '${data.appointmentable!.name}',
//                           type: 'Live Chat',
//                           status: '${data.appointmentable!.status}',
//                           image: 'assets/images/profile.png',
//                           timeRange: '${data.time ?? ""}',
//                         ),
//                       );
//
//                     }else{
//                       return Container();
//                     }
//
//                   },
//                 )),
//     );
//   }
//
//   Widget sendCallButton({
//     required bool isVideoCall,
//     required String? id,
//     required TextEditingController inviteeUsersIDTextCtrl,
//     required BuildContext context,
//     void Function(String code, String message, List<String>)? onCallFinished,
//   }) {
//     return ValueListenableBuilder<TextEditingValue>(
//       valueListenable: inviteeUsersIDTextCtrl,
//       builder: (context, inviteeUserID, _) {
//         final invitees = getInvitesFromTextCtrl(id.toString());
//         print("Apoint IDDD __${id}");
//         print("Call Finished __${onCallFinished}");
//         return ZegoSendCallInvitationButton(
//           isVideoCall: isVideoCall,
//           invitees: invitees,
//           resourceID: 'zego_data',
//           iconSize: const Size(40, 40),
//           buttonSize: const Size(50, 50),
//           onPressed: onCallFinished,
//         );
//       },
//     );
//   }
//
//   List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
//     final invitees = <ZegoUIKitUser>[];
//
//     final inviteeIDs = textCtrlText.trim().replaceAll('，', '');
//     inviteeIDs.split(',').forEach((inviteeUserID) {
//       if (inviteeUserID.isEmpty) {
//         return;
//       }
//
//       invitees.add(ZegoUIKitUser(
//         id: inviteeUserID,
//         name: 'user_$inviteeUserID',
//       ));
//     });
//
//     return invitees;
//   }
//
//   void onSendCallInvitationFinished(
//     String code,
//     String message,
//     List<String> errorInvitees,
//   ) {
//     if (errorInvitees.isNotEmpty) {
//       var userIDs = '';
//       for (var index = 0; index < errorInvitees.length; index++) {
//         if (index >= 5) {
//           userIDs += '... ';
//           break;
//         }
//
//         final userID = errorInvitees.elementAt(index);
//         userIDs += '$userID ';
//       }
//       if (userIDs.isNotEmpty) {
//         userIDs = userIDs.substring(0, userIDs.length - 1);
//       }
//
//       var message = "User doesn't exist or is offline: $userIDs";
//       if (code.isNotEmpty) {
//         message += ', code: $code, message:$message';
//       }
//       Fluttertoast.showToast(
//           msg: message,
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     } else if (code.isNotEmpty) {
//       Fluttertoast.showToast(
//           msg: message,
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//   }
//   Future<void> dataSetter(List<Datum> userData, int index) async {
//     final pref = await SharedPreferences.getInstance();
//     final data = userData[index];
//     pref.setString('ap_id', data.id.toString());
//     pref.setString('pst_name', data.consultation!.fullName!);
//     pref.setString('weight', data.consultation!.weight!.toString());
//     pref.setString('address', data.consultation!.fullAddress!);
//     pref.setString('age', data.consultation!.age!);
//     pref.setString('sex', "Male");
//     pref.setString('reason', data.consultation!.mainReason!);
//     pref.setString('aUser_id', data.appointmentable!.id.toString());
//     print("ABir Save__${pref.getString('ap_id')}");
//   }
//
// }
