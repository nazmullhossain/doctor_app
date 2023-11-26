import 'dart:convert';

import 'package:doctor_app/view/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/app_controller.dart';
import '../../global_widgets/bottom_bar.dart';
import '../../model/register_model.dart';

class MobileNumberInputScreen extends StatefulWidget {
  @override
  _MobileNumberInputScreenState createState() =>
      _MobileNumberInputScreenState();
}

class _MobileNumberInputScreenState extends State<MobileNumberInputScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'US');
  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool status = true;
  bool isObscure = true;
  bool isChecked = false;
  String email = "";
  String name = "";
  String phone = "";
  String pass = "";
  String userName = "";
  String confirmPass = "";
  bool isLoading = false;
  final TextEditingController nameCOntroller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        toolbarHeight: 70,
        title: Text(
          'Registration',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  child: Center(
                    child: TextFormField(
                      controller: nameCOntroller,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        helperText: " ",
                        hintText: "Name",
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        // else if (!RegExp(
                        //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //     .hasMatch(email)) {
                        //   return 'Email is invalid';
                        // }
                        else {
                          return null;
                        }
                      },
                      onSaved: (String? newValue) {
                        name = newValue ?? '';
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: 80,
                  child: Center(
                    child: TextFormField(
                      controller: phoneController,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        helperText: " ",
                        hintText: "Phone",
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone is required';
                        }
                        // else if (!RegExp(
                        //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //     .hasMatch(email)) {
                        //   return 'Email is invalid';
                        // }
                        else {
                          return null;
                        }
                      },
                      onSaved: (String? newValue) {
                        phone = newValue ?? '';
                      },
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 80,
                //   child: Center(
                //     child: TextFormField(
                //       controller: userNameController,
                //       maxLines: 1,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //         helperText: " ",
                //         hintText: "UserName",
                //         contentPadding:
                //             const EdgeInsets.fromLTRB(13, 10, 0, 12),
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(5),
                //           borderSide: const BorderSide(),
                //         ),
                //         focusedBorder: const OutlineInputBorder(
                //           borderSide: BorderSide(),
                //         ),
                //       ),
                //       validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'Username is required';
                //         }
                //         // else if (!RegExp(
                //         //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //         //     .hasMatch(email)) {
                //         //   return 'Email is invalid';
                //         // }
                //         else {
                //           return null;
                //         }
                //       },
                //       onSaved: (String? newValue) {
                //         userName = newValue ?? '';
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: TextFormField(
                      controller: passcontroller,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        //   else if (!RegExp(r'^().{8,}$').hasMatch(password)) {
                        //     return 'At least 8 char needed';
                        // //   }
                        else {
                          return null;
                        }
                      },
                      onSaved: (String? newValue) {
                        pass = newValue ?? '';
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: TextFormField(
                      controller: confirmPassController,
                      maxLines: 1,
                      obscureText: isObscure,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        helperText: " ",
                        contentPadding:
                            const EdgeInsets.fromLTRB(13, 10, 0, 12),
                        labelText: 'Confirm Password',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        //   else if (!RegExp(r'^().{8,}$').hasMatch(password)) {
                        //     return 'At least 8 char needed';
                        // //   }
                        else {
                          return null;
                        }
                      },
                      onSaved: (String? newValue) {
                        confirmPass = newValue ?? '';
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                loader
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.indigoAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            userRegistreation();
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool loader = false;
  RegisterModel? registerModel;
  Future<RegisterModel?> userRegistreation() async {
    final pref = await SharedPreferences.getInstance();
    final AppController appController = Get.find();

    setState(() {
      loader = true;
    });
    Map body = {
      'name': "${nameCOntroller.text}",
      'phone': "${phoneController.text}",
      'password': "${passcontroller.text}",
      'confirm_password': "${confirmPassController.text}"
    };
    print(body);
    var response = await http.post(
      Uri.parse("https://www.treatmenticwl.com/api/register"),
      body: body,
      headers: {"Accept": "application/json"},
    );
    print("ress_${response.body}");
    registerModel = registerModelFromJson(response.body);

    if (response.statusCode == 200) {
      setState(() {
        print("ress_${response.body}");
        registerModel = registerModelFromJson(response.body);

        appController.setToken(registerModel!.token.toString());
        appController.setId(registerModel!.data!.id!.toString());
        appController.setName(registerModel!.data!.name.toString());
        appController.setPhone(registerModel!.data!.phone.toString());
        loader = false;

        Get.offAll(CustomBottomBar());
      });
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      Fluttertoast.showToast(
          msg: "${data["messages"]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        loader = false;
      });
    } else {
      setState(() {
        loader = false;
      });
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return registerModel;
  }
}
