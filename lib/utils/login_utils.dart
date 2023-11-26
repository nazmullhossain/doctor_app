import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_services/auth_service.dart';
import '../global_widgets/bottom_bar.dart';


class SignInUtility {

  static Future<void> performDoctorSignIn(context, String email, String password) async {
    try {
      final authService = AuthService();
      final token = await authService.loginDoctor(email, password,context);

      if (token.isNotEmpty) {
        final AppController appController = Get.find();
        appController.setToken(token);
        Get.off(()=>CustomBottomBar());

      } else {
        print('Failed to obtain token from login');
      }
    } catch (e) {
      print('Failed to perform sign-in: $e');
    }
  }
  static Future<void> performAgentSignIn(context, String email, String password) async {
    try {
      final authService = AuthService();
      final token = await authService.loginAgent(email, password,context);

      if (token.isNotEmpty) {
        final AppController appController = Get.find();
        appController.setToken(token);
        Get.off(()=>CustomBottomBar());

      } else {
        print('Failed to obtain token from login');
      }
    } catch (e) {
      print('Failed to perform sign-in: $e');
    }
  }
  static Future <void> performUserSignIn(context, String email, password) async {
    try {
      final authService = AuthService();
      final token = await authService.loginGeneralUser(email, password,context);
      print(token);
      if (token.isNotEmpty) {

        final AppController appController = Get.find();
        appController.setToken(token);
        Get.off(()=>CustomBottomBar());

      } else {
        print('Failed to obtain token from login');
      }
    } catch (e) {
      print('Failed to perform sign-in: $e');
    }
  }
}