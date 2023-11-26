import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/forgotPass/reset_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
 class ForgotPassScreen extends StatefulWidget {

   const ForgotPassScreen({super.key});

   @override
   State<ForgotPassScreen> createState() => _ForgotPassScreenState();
 }
 
 class _ForgotPassScreenState extends State<ForgotPassScreen> {
   final TextEditingController phone = TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Forgot pass"),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.all(18.0),
               child: TextField(
                 controller: phone,
                 decoration: InputDecoration(
                   hintText: "Enter your phone number",
                   border: OutlineInputBorder(

                   )
                 ),
               ),
             ),

             SizedBox(height: 30,),

             ElevatedButton(onPressed: (){
               submit();
             }, child: Text("Submit"))
           ],
         ),
       ),
     );
   }

   submit()async{
     final AppController appController = Get.find();

     var request = http.MultipartRequest('POST', Uri.parse('https://www.treatmenticwl.com/api/send-password-reset-pin-by-phone'));
     request.fields.addAll({
       'phone': '${phone.text}',
       'for_doctor_agent': appController.usertype=="user" ? "0" : "1",
     });


     http.StreamedResponse response = await request.send();

     if (response.statusCode == 200) {
       print(await response.stream.bytesToString());
       Get.snackbar("Success", "${response.reasonPhrase}",backgroundColor: Colors.green,colorText: Colors.white);

       Get.off(ResetScreen(
         phone: phone.text,
       ));
     }
     else {
       Get.snackbar("Error", "${response.reasonPhrase}",backgroundColor: Colors.red,colorText: Colors.white);
       print(response.reasonPhrase);
     }

   }
 }
 