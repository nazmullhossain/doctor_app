import 'package:doctor_app/utils/signup_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../api_services/auth_service.dart';
import '../../../model/registration_model.dart';
import 'login_screen.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  String email = '';
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  String name = '';
  String userName = '';
  String phone = '';
  bool obscurePass = true;
  bool obscureConfirmPass = true;
  bool isLoading = false;
  final authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _signUpKey,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: 'Name',
                                        contentPadding: const EdgeInsets.fromLTRB(
                                            13, 10, 0, 12),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide()),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide())),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Name is required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (String? newValue) {
                                      name = newValue!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Username',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: 'Username',
                                        contentPadding: const EdgeInsets.fromLTRB(
                                            13, 10, 0, 12),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide()),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide())),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Username is required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (String? newValue) {
                                      userName = newValue!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: 'Please Enter Your Email',
                                contentPadding:
                                    const EdgeInsets.fromLTRB(13, 10, 0, 12),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide()),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide())),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!SignUpUtils.isValidEmail(value)) {
                                return 'Please enter a valid email address';
                              }
                                return null;
                            },
                            onSaved: (String? newValue) {
                              email = newValue!;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(13, 10, 0, 12),
                                labelText: 'Phone',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide()),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide())),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone is required';
                              }
                              if (value.length != 11) {
                                return '11 digits required';
                              }
                              return null;
                            },
                            onSaved: (String? newValue) {
                              phone = newValue ?? '';
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            controller: password,
                            maxLines: 1,
                            obscureText: obscurePass,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(13, 10, 0, 12),
                                labelText: 'Please Enter Your Password',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obscurePass = !obscurePass;
                                      });
                                    },
                                    child: Image.asset('assets/images/view.png')),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide()),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide())),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length != 8) {
                                return 'At least 8 char needed';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 45,
                        child: Center(
                          child: TextFormField(
                            controller: confirmPass,
                            keyboardType: TextInputType.text,
                            obscureText: obscureConfirmPass,
                            maxLines: 1,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obscureConfirmPass = !obscureConfirmPass;
                                      });
                                    },
                                    child: Image.asset('assets/images/view.png')),
                                hintText: 'Confirm Password',
                                contentPadding:
                                    const EdgeInsets.fromLTRB(13, 10, 0, 12),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide()),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide())),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please re-enter password';
                              }

                              if (password.text != confirmPass.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.cyanAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                              onPressed: () async {
                                if (_signUpKey.currentState!.validate()) {
                                  _signUpKey.currentState!.save();
                                  try {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    final navigator = Navigator.of(context);

                                    await authService.registerUser(
                                     RegistrationModel(
                                        name: name,
                                        email: email,
                                        phone: phone,
                                        username: userName,
                                        password: password.text,
                                        confirmPassword: confirmPass.text,
                                      ),
                                      context
                                    );
                                    navigator.pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                             const LoginScreen()));
                                  } catch (e) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Registration Error'),
                                          content:
                                              const Text('Failed to register user'),
                                          actions: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor: Colors.cyanAccent,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12))),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } finally {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              },
                              child: const Center(child: Text('Sign Up')),
                            ),
                      const SizedBox(height: 7),
                      GestureDetector(
                        onTap: () => Get.to(()=>LoginScreen()), // Handle "Sign In" text tap
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.cyanAccent,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text('Sign In',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  // ... existing code ...
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


