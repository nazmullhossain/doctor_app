// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:get/get.dart';
//
// import '../controllers/app_controller.dart';
//
// class AppointmentSelectionForm extends StatefulWidget {
//
//   final String ?startDayForSchdule;
//   final String ?startDayForInstance;
//   final String ?startTimeForInstant;
//   final String ?d;
//   final String ?e;
//
//   const AppointmentSelectionForm({super.key, this.startDayForSchdule, this.startDayForInstance, this.startTimeForInstant, this.d, this.e});
//
//   @override
//   State<AppointmentSelectionForm> createState() => _AppointmentSelectionFormState();
// }
//
// class _AppointmentSelectionFormState extends State<AppointmentSelectionForm> {
//   final AppController controller = Get.find();
//
//   List<Map<String, dynamic>> days = [
//     {'name': 'Mon'},
//     {'name': 'Tues'},
//     {'name': 'Wed'},
//     {'name': 'Thu'},
//     {'name': 'Fri'},
//     {'name': 'Satu'},
//     {'name': 'Sun'},
//   ];
//
//   List<String> generateAppointmentTimes() {
//     List<String> appointmentTimes = [];
//     int startHour = 10;
//     int startMinute = 0;
//
//     for (int i = 0; i < 30; i++) {
//       String time = formatTime(startHour, startMinute);
//       appointmentTimes.add(time);
//
//       startMinute += 30;
//       if (startMinute >= 60) {
//         startHour++;
//         startMinute = 0;
//       }
//     }
//
//     return appointmentTimes;
//   }
//
//   String formatTime(int hour, int minute) {
//     String period = 'AM';
//     if (hour >= 12) {
//       period = 'PM';
//       if (hour > 12) {
//         hour -= 12;
//       }
//     }
//     String formattedHour = hour.toString().padLeft(2, '0');
//     String formattedMinute = minute.toString().padLeft(2, '0');
//     return '$formattedHour:$formattedMinute $period';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> appointmentTimes = generateAppointmentTimes();
//     DateTime now = DateTime.now();
//     DateTime startDate = now.subtract(Duration(days: now.weekday - 2));
//     List<DateTime> currentWeekDates = [];
//     for (int i = 0; i < 7; i++) {
//       currentWeekDates.add(startDate.add(Duration(days: i)));
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         leading:  IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey),
//                 height: 25,
//                 width: 25,
//                 child: const Icon(
//                   Icons.navigate_before,
//                   color: Colors.black,
//                 ))),
//         elevation: 0,
//         title: Text('Appointment Form'),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(8),
//         child:Obx(() =>  Column(
//           children: [
//             SizedBox(height: 4,),
//             Text(
//               'Select Appointment Day:',
//               style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 6,),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: days.map((day) {
//                     String dayName = day['name'];
//                     int dayNumber = currentWeekDates[days.indexOf(day)].day;
//                     bool isSelected = controller.selectedDay.value == dayNumber;
//
//                     return Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           controller.selectDay(dayNumber);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: isSelected ? Colors.indigo : Colors.grey,
//                         ),
//                         child: Column(
//                           children: [
//                             Text(
//                               dayName,
//                               style: TextStyle(
//                                 color: isSelected ? Colors.white : Colors.black,
//                               ),
//                             ),
//                             Text(
//                               '$dayNumber',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: isSelected ? Colors.white : null,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Select Appointment Time:',
//               style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: GridView(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,childAspectRatio:1.3),
//                 children: appointmentTimes.map((time) {
//                   bool isSelected =
//                       controller.selectedAppointmentTime.value == time;
//                   return Container(
//                     margin: EdgeInsets.all(4),
//                     child: ElevatedButton(
//
//                       onPressed: () {
//                         controller.selectTime(time);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                         backgroundColor: isSelected ? Colors.indigo : Colors.grey,
//                         foregroundColor: isSelected ? Colors.white : Colors.black,
//                       ),
//                       child: Text(time),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Get.snackbar(
//
//                     "Success", "Appointment Schedule Successfully",backgroundColor: Colors.green,colorText: Colors.white);
//
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.indigo,
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: Text('Confirm'),
//             ),
//           ],
//         ),
//         ),
//       ),
//     );
//   }
// }
