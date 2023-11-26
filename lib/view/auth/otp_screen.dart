// import 'package:doctor_app/controllers/app_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';
// import 'package:http/http.dart' as http;
//
// import '../../global_widgets/bottom_bar.dart';
//
// class OtpScreen extends StatefulWidget {
//   final String? name;
//
//   const OtpScreen({super.key, this.name});
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   String? otp;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         elevation: 0,
//         backgroundColor: Colors.indigo,
//         title: Text(
//           'OTP Verification',
//           style: TextStyle(
//               fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Enter the OTP sent to your mobile number ${widget.name}',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Pinput(
//                 androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
//                 listenForMultipleSmsOnAndroid: true,
//
//                 length: 8,
//                 //   autofocus: true,
//                 closeKeyboardWhenCompleted: true,
//                 defaultPinTheme: PinTheme(
//                   width: 40,
//                   height: 46,
//                   textStyle: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onCompleted: (pin) {
//                   setState(() {
//                     otp = pin;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(height: 40),
//         loader ? Center(
//           child: CircularProgressIndicator(),
//         ) :   ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.indigo,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12))),
//               onPressed: () {
//                 postVerify();
//               },
//               child: Text('Verify OTP'),
//             ),
//             SizedBox(height: 20),
//             // TextButton(
//             //   onPressed: () {
//             //
//             //   },
//             //   child: Text('Resend OTP'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool loader = false;
//
//   postVerify() async {
//     setState(() {
//       loader = true;
//     });
//     final AppController appController = Get.find<AppController>();
//     String? token = appController.token;
//     var headers = {'Authorization': 'Bearer $token'};
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('https://www.treatmenticwl.com/api/verify/phone'));
//     request.fields.addAll({'code': '$otp'});
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       setState(() {
//         loader = false;
//       });
//       Get.offAll(CustomBottomBar());
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
// }
