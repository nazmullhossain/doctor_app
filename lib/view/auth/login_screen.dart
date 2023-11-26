import 'package:doctor_app/forgotPass/forgot_pass_screen.dart';
import 'package:doctor_app/view/auth/mobile_number_input.dart';
import 'package:doctor_app/view/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api_services/user_service.dart';
import '../../controllers/app_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool status = true;
  bool isObscure = true;
  bool isChecked = false;
  String email = "";
  String pass = "";
  UserService apiService = UserService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 85,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: Container(
                margin: EdgeInsets.only(top: 8),
                child: Image.asset(
                  'assets/images/slogan.jpg',
                ),
              )),
          actions: [
            // FlutterSwitch(
            //   width: 68.0,
            //   height: 32.0,
            //   activeText: "বাং",
            //   inactiveText: "En",
            //   valueFontSize: 12.0,
            //   toggleSize: 42.0,
            //   value: status,
            //   borderRadius: 30.0,
            //   showOnOff: true,
            //   onToggle: (val) {
            //     setState(() {
            //       status = val;
            //     });
            //   },
            // ),
            // const SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _loginFormKey,
              child: Card(
                margin: EdgeInsets.only(top: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Sign in to explore the features available for you",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Sign in",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
                        child: Center(
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              helperText: " ",
                              hintText: "Phone Number",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 10, 0, 12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (val){
                              email = val ?? '';
                            },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Email is required';
                            //   }
                            //   // else if (!RegExp(
                            //   //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //   //     .hasMatch(email)) {
                            //   //   return 'Email is invalid';
                            //   // }
                            //   else {
                            //     return null;
                            //   }
                            // },
                            // onSaved: (String? newValue) {
                            //   email = newValue ?? '';
                            // },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Center(
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: isObscure,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              helperText: " ",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 10, 0, 12),
                              labelText: 'Password',
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  child: Image.asset('assets/images/show.png')),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (val){
                              pass = val ?? '';
                            },
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Password is required';
                            //   }
                            //   //   else if (!RegExp(r'^().{8,}$').hasMatch(password)) {
                            //   //     return 'At least 8 char needed';
                            //   // //   }
                            //   else {
                            //     return null;
                            //   }
                            // },
                            // onSaved: (String? newValue) {
                            //   pass = newValue ?? '';
                            // },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  value: isChecked,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              const Text(
                                'Remember Me',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(ForgotPassScreen());
                            },
                            child: const Text('Forgot Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(() {
                        if (appController.signInLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.cyanAccent,
                                  foregroundColor: Colors.black),
                              onPressed: () async {

                                //  _loginFormKey.currentState!.save();
                                  _hideKeyboard();
                                  await appController.performSignIn(
                                      context, email, pass);


                              },
                              child: const Center(child: Text('Login')),
                            ),
                          );
                        }
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      appController.usertype == 'user'
                          ? Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(
                                    () => MobileNumberInputScreen(),
                                  );
                                },
                                child: const Text('Create Account',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              ),
                            ),
                          )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
