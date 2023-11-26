import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResetScreen extends StatefulWidget {
  final String? phone;
  const ResetScreen({super.key, this.phone});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final TextEditingController pin = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: pin,
                decoration: InputDecoration(
                    hintText: "Enter Your Reset Code",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: newPass,
                decoration: InputDecoration(
                    hintText: "Enter your new password",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: confirmPass,
                decoration: InputDecoration(
                    hintText: "Enter your confirm password",
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  submit();
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  submit() async {
    final AppController appController = Get.find();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://www.treatmenticwl.com/api/password-reset'));
    request.fields.addAll({
      'email_or_phone': '${widget.phone}',
      'for_doctor_agent': appController.usertype == "user" ? "0" : "1",
      'pin': '${pin.text}',
      'new_password': '${newPass.text}',
      'confirm_password': '${confirmPass.text}'
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.offAll(LoginScreen());
    } else {
      print(response.reasonPhrase);
    }
  }
}
