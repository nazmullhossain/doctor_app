import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/model/prescription_sent_to_dr.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/prescription_model.dart';

class PrescriptionService {
  static final String baseUrl = 'https://www.treatmenticwl.com/api';
 static  AppController appController = Get.find();

  Future<void> addPrescription(context,String photoPath,descriptions) async {
    var url = Uri.parse('$baseUrl/prescription/add');
final token = appController.token;
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $token';

    request.fields['descriptions'] = descriptions;

    var file = File(photoPath);
    request.files.add(await http.MultipartFile.fromPath('photo', file.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Prescription added successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add prescription. Status code: ${response.statusCode}')));

    }
  }

static  Future<void> updatePrescription(context,int prescriptionId, String photoPath, descriptions) async {
    var url = Uri.parse('$baseUrl/prescription/update/$prescriptionId');
    final token = appController.token;
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $token';

    request.fields['descriptions'] = descriptions;

    var file = File(photoPath);
    request.files.add(await http.MultipartFile.fromPath('photo', file.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Prescription updated successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update prescription. Status code: ${response.statusCode}')));

    }
  }

  Future<void> deletePrescription(context,int prescriptionId) async {
    var url = Uri.parse('$baseUrl/prescription/delete/$prescriptionId');
    final token = appController.token;
    var response = await http.delete(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Prescription deleted successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete prescription')));

    }
  }

  Future<void> sendPrescriptionToDoctor(int prescriptionId, int doctorId,int appointmentId) async {
    var url = Uri.parse('https://treatmenticwl.com/api/prescription/send');
    final token = appController.token;
    var body = {
      'prescription_id': prescriptionId.toString(),
      'doctor_id': doctorId.toString(),
      'appointment_id': appointmentId.toString(),
    };

    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'}, body: body);
    print("qqq${response.body}");
    print("rrrr${response.statusCode}");

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print("O RES__${response.body}");
      if(jsonData["success"]==true){
        Fluttertoast.showToast(
            msg: "${jsonData["message"]}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        print("E RES__${response.body}");

        Fluttertoast.showToast(
            msg: "${jsonData["message"]}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

      print('Prescription sent to doctor successfully!');
    } else if(response.statusCode==403) {
      var jsonData = json.decode(response.body);
      Fluttertoast.showToast(
          msg: "${jsonData["message"]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print('Failed to send prescription to doctor. Status code: ${response.statusCode}');
    }
  }


 static Future<List<PrescriptionData>?> fetchUploadedPrescriptions() async {
    var url = Uri.parse('$baseUrl/prescription/all');
    final token = appController.token;
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = json.decode(response.body);
      print("Resssss---${response.body}");
      print("Resssss---${jsonData}");
     return PrescriptionModel.fromJson(jsonData).data;

    } else {
      print('Failed to retrieve prescriptions. Status code: ${response.statusCode}');
      return [];
    }
  }

  static Future<List<PrescriptionsData>?> prescriptionsSentByUsersToDr() async {
    var url = Uri.parse('$baseUrl/doctor/prescriptions');
    final AppController appController = Get.find();
    final token = appController.token;
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      log(response.body);
      final List<dynamic> jsonList = json.decode(response.body)['data'];
      return jsonList.map((json) => PrescriptionsData.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch prescriptions');
    }
  }


  Future<List<PrescriptionData>?> showSentPrescriptions() async {
    var url = Uri.parse('$baseUrl/prescription/sent');
    final token = appController.token;
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var prescriptionModel = PrescriptionModel.fromJson(jsonData);
      return prescriptionModel.data;
    } else {
      print('Status code: ${response.statusCode}');
      return [];
    }
  }
}
