// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../../controllers/app_controller.dart';
// import '../../../model/payment_list_model.dart';
// import '../balance_screen.dart';
// import 'create_payment_screen.dart';
//
// class PaymentListScreen extends StatefulWidget {
//   const PaymentListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PaymentListScreen> createState() => _PaymentListScreenState();
// }
//
// class _PaymentListScreenState extends State<PaymentListScreen> {
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     //getPaymentList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Get.to(CreatePaymentScreen(),);
//         },child: Icon(Icons.add),),
//       appBar: AppBar(
//         title: Text("Payment Screen"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(onPressed: (){
//               Get.to(BalanceScreen());
//
//             }, child: Text("Wallet")),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
