import 'dart:convert';
import 'dart:developer';
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/model/dr_by_dept.dart';
import 'package:doctor_app/model/dr_by_symptom.dart';
import 'package:doctor_app/model/slider_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/agent_model.dart';
import '../model/all_country_model.dart';
import '../model/all_doctors.dart';
import '../model/department_model.dart';
import '../model/doctor_model.dart';
import '../model/symptom_model.dart';
import '../model/user_model.dart';

class UserService {
  static const baseUrl = 'https://www.treatmenticwl.com/api';
  static final AppController appController = Get.find();

  Future<AllCountryModel?> getApicall() async {
    final token = appController.token;

    var response = await http.get(
      Uri.parse("https://treatmenticwl.com/api/countries"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    print("abir${token}");
    if (response.statusCode == 200) {
      print("RESS Country_${response.body}");

      return allCountryModelFromJson(response.body);
    } else {}
  }

  static Future<UserModel> fetchUserProfile() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/user/profile');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return UserModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
  // static  Future<List<AllDoctorsData>> searchDoctor(String query) async {
  //    final String apiUrl = 'https://www.treatmenticwl.com/api/search';
  // final token = appController.token!;
  //
  //    final response = await http.get(
  //      Uri.parse('$apiUrl?query=$query'),
  //      headers: {'Authorization': 'Bearer $token'},
  //    );
  //
  //    if (response.statusCode == 200) {
  //      final jsonString = response.body;
  //
  //      return allDoctorsFromJson(jsonString).data;
  //    } else {
  //
  //      throw Exception('Failed to load data: ${response.statusCode}');
  //    }
  //  }

  Future<void> updateUserProfile({
    required String name,
    required String phone,
    required String gender,
    required String about,
    required String countryId,
    String? profile_pic,
  }) async {
    final token = appController.token;
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/user/profile/update'),
    );
    request.headers.addAll(headers);

    request.fields['name'] = name;
    request.fields['phone'] = phone;
    request.fields['gender'] = gender;
    request.fields['about'] = about;
    request.fields['country_id'] = "$countryId";

    if (profile_pic != null) {
      var file = await http.MultipartFile.fromPath(
        'profile_pic',
        profile_pic,
        filename: 'profile_pic',
      );
      request.files.add(file);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Profile update successful');
    } else {
      print("RESS__${response.reasonPhrase}");
      print('Profile update failed with status code: ${response.statusCode}');
    }
  }

  Future<void> updateAgentProfile({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String about,
    required String country_id,
    String? profile_pic,
  }) async {
    final token = appController.token;
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/agent/profile/update'),
    );
    request.headers.addAll(headers);

    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;
    request.fields['gender'] = gender;
    request.fields['about'] = about;
    request.fields['country_id'] = "$country_id";

    if (profile_pic != null) {
      var file = await http.MultipartFile.fromPath(
        'profile_pic',
        profile_pic,
        filename: 'profile_pic',
      );
      request.files.add(file);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Profile update successful');
    } else {
      print('Profile update failed with status code: ${response.statusCode}');
    }
  }

  static Future<AgentModel> getAgentProfile() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/agent/profile');

    final headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      final jsonResponse = json.decode(response.body);
      return AgentModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch agent data');
    }
  }

  Future<List<SliderData>?> fetchSliders() async {
    final url = Uri.parse('$baseUrl/sliders');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return SliderModel.fromJson(jsonResponse).data;
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  Future<List<SymptomData>> fetchSymptoms() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/symptoms');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse =
          json.decode(response.body); // Parse the response body into JSON
      List<SymptomData> symptoms = [];
      for (var data in jsonResponse['data']) {
        SymptomData symptomData = SymptomData.fromJson(data);
        symptoms.add(symptomData);
      }
      return symptoms;
    } else {
      throw Exception('Failed to fetch department data');
    }
  }

  static Future<List<DoctorsData>?> fetchAllDoctors() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor/all-doctors');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonString = response.body;

      return allDoctorsModelFromJson(jsonString).data;
    } else {
      throw Exception('Failed to fetch doctors. Error: ${response.statusCode}');
    }
  }

  static Future<List<DoctorsData>?> fetchAvailableDoctors() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor/available');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonString = response.body;

      return allDoctorsModelFromJson(jsonString).data;
    } else {
      throw Exception('Failed to fetch doctors. Error: ${response.statusCode}');
    }
  }

  static Future<List<DoctorsData>?> fetchRandomDoctors() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor/random');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonString = response.body;

      return allDoctorsModelFromJson(jsonString).data;
    } else {
      throw Exception('Failed to fetch doctors. Error: ${response.statusCode}');
    }
  }

  static Future<List<DoctorByDept>?> getDoctorsByDepartment(
      int? departmentId) async {
    final url =
        Uri.parse('$baseUrl/doctor/doctors-by-department/$departmentId');
    final token = appController.token;
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonString = response.body;
        return drByDeptModelFromJson(jsonString).data?.doctors;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }

  static Future<List<DoctorBySymptom>?> getDoctorsBySymptom(
      int symptomId) async {
    final url = Uri.parse('$baseUrl/doctor/doctors-by-department/$symptomId');
    final token = appController.token;
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonString = response.body;
        print("RES__${response.body}");
        return drBySymptomModelFromJson(jsonString).data?.doctors;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }

  static Future<DoctorModel?> getAnyDoctorProfile(int doctorId) async {
    final url = Uri.parse('$baseUrl/doctor/$doctorId');
    final token = appController.token;

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      log(response.body);
      final jsonResponse = json.decode(response.body);
      return DoctorModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch doctor data');
    }
  }

  static Future<List<DepartmentData>> fetchDepartmentData() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/departments');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<DepartmentData> departments = [];
      for (var data in jsonResponse['data']) {
        DepartmentData departmentData = DepartmentData.fromJson(data);
        departments.add(departmentData);
      }

      return departments;
    } else {
      throw Exception('Failed to fetch department data');
    }
  }

  static Future<void> addReview(
      String doctorId, stars, reviewText, token) async {
    final url = Uri.parse('$baseUrl/review');
    final token = appController.token;
    final headers = {'Authorization': 'Bearer $token'};
    final body = {
      'doctor_id': doctorId,
      'stars': stars,
      'review_text': reviewText,
    };

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print('Review added successfully');
    } else {
      print('Failed to add review');
    }
  }

  static Future<void> editReview(
    String stars,
    String reviewText,
    review_id,
  ) async {
    final url = Uri.parse('$baseUrl/review/edit');
    final token = appController.token;
    final headers = {'Authorization': 'Bearer $token'};
    final body = {
      'stars': stars,
      'review_text': reviewText,
      'review_id': review_id,
    };

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print('Review edited successfully');
    } else {
      print('Failed to edit review');
    }
  }
}
