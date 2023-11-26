import 'dart:convert';
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/registration_model.dart';

class AuthService {
  static final AppController appController = Get.find();
  static const baseUrl = 'https://www.treatmenticwl.com/api';

  Future<Map<String, dynamic>> registerUser(
      RegistrationModel user, context) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(url, body: user.toJson());
    if (response.statusCode == 200) {
      print(response.statusCode);
      return json.decode(response.body);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to register user")));

      throw Exception('Failed to register user');
    }
  }

  static Future<void> logout() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/logout');
    final headers = {
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        appController.setToken('');
        appController.setUsertype('');

        print('Logout successful');
      } else {
        print('Logout failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during logout: $e');
    }
  }

  Future<String> loginGeneralUser(
      String email, String password, context) async {
    final pref = await SharedPreferences.getInstance();
    final url = Uri.parse('$baseUrl/login');
    final body = {'user': email, 'password': password};
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      pref.setString('phone', jsonResponse['data']['phone']);
      final token = jsonResponse['token'] as String;
      appController.setId(jsonResponse['data']["id"].toString());
      appController.setName(jsonResponse['data']["name"].toString());
      appController.setPhone(jsonResponse['data']["phone"].toString());
      appController.userTypeSet(jsonResponse['data']["usertype"].toString());
      return token;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to login user")));
      throw Exception('Failed to login user');
    }
  }

  Future<String> loginDoctor(
      String email, String password, context) async {
    final url = Uri.parse('$baseUrl/doctor/login');
    final body = {'user': email, 'password': password};
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['token'] as String;
      appController.setId(jsonResponse['data']["id"].toString());
      appController.setName(jsonResponse['data']["name"].toString());
      appController.setPhone(jsonResponse['data']["phone"].toString());
      appController.userTypeSet(jsonResponse['data']["usertype"].toString());
      return token;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to login doctor")));
      throw Exception('Failed to login doctor');
    }
  }

  Future<String> loginAgent(
      String email, String password, context) async {
    final url = Uri.parse('https://www.treatmenticwl.com/api/agent/login');
    final body = {'user': email, 'password': password};
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print("RES__${response.body}");
      final token = jsonResponse['token'] as String;
      appController.setId(jsonResponse['data']["id"].toString());
      appController.setName(jsonResponse['data']["name"].toString());
      appController.setPhone(jsonResponse['data']["phone"].toString());
      appController.userTypeSet(jsonResponse['data']["usertype"].toString());
      return token;
    } else {
      print("RES__${response.body}");

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to login agent")));
      throw Exception('Failed to login agent');
    }
  }
}