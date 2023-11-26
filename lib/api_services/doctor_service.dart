import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/app_controller.dart';
import '../model/appointment_schedule_model.dart';
import '../model/doctor_model.dart';
class
DoctorService {
  static const baseUrl = 'https://www.treatmenticwl.com/api';
  static final AppController appController = Get.find();

  static Future<DoctorModel> fetchDoctorProfile() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor/profile');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print("$response+$token");
    if (response.statusCode == 200) {
      final jsonString = response.body;
      print(response.body);
      return doctorModelFromJson(jsonString);
    } else {
      throw Exception(
          'Failed to fetch doctor profile. Error: ${response.statusCode}');
    }
  }

  static Future<Education> fetchDoctorEducations() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor/education/index');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final jsonString = response.body;
        return Education.fromJson(jsonDecode(jsonString));
      } else {
        throw Exception('Failed to fetch education');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> addDoctorEducations(context,
      {required degree, institute_name, passing_year}) async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor/education/store');
    final body = {
      'degree': degree,
      'institute_name': institute_name,
      'passing_year': passing_year,

    };
    final headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.post(
          url,
          headers: headers, body: body
      );
      if (response.statusCode == 200) {

      } else {
        throw Exception('Failed to add education');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> updateDoctorEducations(context,
      {required degree, institute_name, passing_year, education_id}) async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor/education/update/$education_id');
    final body = {
      'degree': degree,
      'institute_name': institute_name,
      'passing_year': passing_year,

    };
    final headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.post(
          url,
          headers: headers, body: body
      );
      if (response.statusCode == 200) {

      } else {
        throw Exception('Failed to add education');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<void> deleteEducation(context, int education_id) async {
    final token = appController.token;

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/doctor/education/delete/$education_id'),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        print("Education data deleted successfully.");
      } else {
        print("Failed to delete edu data Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  static Future<Experience> fetchDoctorExperience() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor-agent/experiences');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final jsonString = response.body;
        return Experience.fromJson(jsonDecode(jsonString));
      } else {
        throw Exception('Failed to fetch experience');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Info> fetchDoctorFees() async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl /doctor-agent/information');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final jsonString = response.body;
        return Info.fromJson(jsonDecode(jsonString));
      } else {
        throw Exception('Failed to fetch fees');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<void> addExperience({required designation,
    departmentId,
    employmentStatus,
    period,
    working_place}) async {
    final url = Uri.parse('$baseUrl/doctor-agent/add-experience');
    final token = appController.token;
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'designation': designation,
      'department_id': departmentId,
      'employment_status': employmentStatus,
      'period': period,
      'working_place': working_place,
    };

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {} else {
        throw Exception('Failed to add experience');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


  static Future<void> updateExperience({
    required String designation,
    employmentStatus,
    period,
    department_id,
    working_place,
    required int experience_id,
  }) async {
    final token = appController.token;
    final url =
    Uri.parse('$baseUrl/doctor-agent/experience-update/$experience_id');
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'designation': designation,
      'department_id': department_id,
      'employment_status': employmentStatus,
      'period': period,
      'working_place': working_place,
    };

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {} else {
        throw Exception('Failed to update experience');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<void> deleteExperience(context, int experience_id) async {
    final token = appController.token;

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/doctor-agent/experience/$experience_id'),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        print("Experience deleted successfully.");
      } else {
        print(
            "Failed to delete experience. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }


  static Future<void> updateDoctorInformation(context, {
    required String consultationFee,
    required String followUpFee,
  }) async {
    final url = Uri.parse('$baseUrl/doctor-agent/information');
    final token = appController.token;
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'consultation_fee': consultationFee,
        'follow_up_fee': followUpFee,
      },
    );

    if (response.statusCode == 200) {
      print('Doctor information updated successfully');
    } else {
      print(
          'Failed to update doctor information. Status code: ${response
              .statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to update doctor information');
    }
  }

  static Future<void> newupdateDoctorInformation(context, {
    required String consultationFee,
    required String followUpFee,
  }) async {
    final url = Uri.parse('$baseUrl/doctor-agent/information-update');
    final token = appController.token;
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'consultation_fee': consultationFee,
        'follow_up_fee': followUpFee,
      },
    );

    if (response.statusCode == 200) {
      print('Doctor information updated successfully');
    } else {
      print(
          'Failed to update doctor information. Status code: ${response
              .statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to update doctor information');
    }
  }

  static Future<ScheduleModel?> fetchPatientAppointment() async {
    final pref = await SharedPreferences.getInstance();
    final AppController appController = Get.put(AppController());
    String ? token = appController.token;
    print(token);
    const apiUrl = 'https://www.treatmenticwl.com/api/doctor/appointments';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        print(response.body);
        return scheduleModelFromJson(response.body);
      } else {
        print('error is ${response.body}');
      }
    } catch (e) {
      print('Error on fetching schedule $e');
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String about,
    required String bmdcNo,
    String? profilePicPath,
    required String? countryId,

  }) async {
    final token = appController.token;
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/doctor/profile/update'),
    );
    request.headers.addAll(headers);

    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;
    request.fields['gender'] = gender;
    request.fields['about'] = about;
    request.fields['bmdc_no'] = bmdcNo;
    request.fields['country_id'] = "$countryId";

    if (profilePicPath != null) {
      var file = await http.MultipartFile.fromPath(
        'profile_pic',
        profilePicPath,
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

  static Future<void> updateStatus(String status) async {
    final token = appController.token;
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
      };

      Map<String, String> body = {
        'status': status,
      };

      var response = await http.post(
        Uri.parse('$baseUrl/doctor/profile/status'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Status update successful');
      } else {
        print('Status update failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Status update failed: $e');
    }
  }

  static Future<void> setDepartments(String departmentIds) async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor-agent/set-department');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'departments_id': departmentIds,
      },
    );

    if (response.statusCode == 200) {
      print('Departments set successfully');
    } else {
      print('Failed to set departments. Error code: ${response.statusCode}');
    }
  }

  static Future<void> setSymptoms(String symptomIds) async {
    final token = appController.token;
    final url = Uri.parse('$baseUrl/doctor-agent/set-symptom');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'symptom_id': symptomIds,
      },
    );

    if (response.statusCode == 200) {
      print('Symptoms set successfully');
    } else {
      print('Failed to set symptoms. Error code: ${response.statusCode}');
    }
  }

  static Future<void> updateService({
    required String instantCall,
    required String appointment,

  }) async {
    final token = appController.token;
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };

    final Map<String, String> body = {
      'instant_call': instantCall,
      'appointment': appointment,

    };

    final http.Response response = await http.post(
      Uri.parse('$baseUrl/doctor/update-service'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('Service updated successfully');
    } else {
      print('Failed to update service');
    }
  }

  static Future<void> updateServiceTime({
    required String start_day_for_instant,
    required String end_day_for_instant,
    required String start_time_for_instant,
    required String end_time_for_instant,
    required String start_day_for_schedule,
    required String end_day_for_schedule,
    required String start_time_for_schedule,
    required String end_time_for_schedule,

  }) async {
    final token = appController.token;
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };

    final Map<String, String> body = {
      'start_day_for_instant': start_day_for_instant,
      'end_day_for_instant': end_day_for_instant,
      'start_time_for_instant': start_time_for_instant,
      'end_time_for_instant': end_time_for_instant,
      'start_day_for_schedule': start_day_for_schedule,
      'end_day_for_schedule': end_day_for_schedule,
      ' start_time_for_schedule': start_time_for_schedule,
      'end_time_for_schedule': end_time_for_schedule,


    };

    final http.Response response = await http.post(
      Uri.parse('$baseUrl/doctor/update-service-time'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('Service updated successfully');
    } else {
      print('Failed to update service');
    }
  }
}