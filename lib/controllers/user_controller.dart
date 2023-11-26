import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/prescription_service.dart';
import '../api_services/user_service.dart';
import '../model/agent_model.dart';
import '../model/all_doctors.dart';
import '../model/department_model.dart';
import '../model/doctor_model.dart';
import '../model/dr_by_dept.dart';
import '../model/dr_by_symptom.dart';
import '../model/prescription_model.dart';
import '../model/symptom_model.dart';
import '../model/user_model.dart';
import 'app_controller.dart';

class UserController extends GetxController {
  var uploadedPrescriptionLoading = false.obs;
  var isAllDrLoading = false.obs;
  var isAvailableDrLoading = false.obs;
  var isRandomDrLoading = false.obs;
  var isSearchDrHomeLoading = false.obs;
  var isSearchDrAllLoading = false.obs;
  var isSearchDrInDeptLoading = false.obs;
  var isSearchDrInSymptomLoading = false.obs;
  var isUserProfileLoading = false.obs;
  var isAgentProfileDrLoading = false.obs;
  var isDrByDeptLoading = false.obs;
  var isDrBySymptomLoading = false.obs;
  var isAnyDrProfileLoading = false.obs;
  var isPrescriptionFromDrLoading = false.obs;
  RxList<PrescriptionData> uploadedPrescriptionsList = <PrescriptionData>[].obs;
  RxList<DoctorsData> doctors = <DoctorsData>[].obs;
  RxList<DoctorsData> availableDoctors = <DoctorsData>[].obs;
  RxList<DoctorsData> randomDoctors = <DoctorsData>[].obs;
  RxList<DoctorBySymptom> doctorsBySymptom = <DoctorBySymptom>[].obs;
  RxList<DoctorByDept> doctorsByDept = <DoctorByDept>[].obs;
  RxList<DoctorsData> foundDoctorsInDrHome = <DoctorsData>[].obs;
  RxList<DoctorsData> foundDoctorsAll = <DoctorsData>[].obs;
  RxList<DoctorBySymptom> foundDoctorsInSymptom = <DoctorBySymptom>[].obs;
  RxList<DoctorByDept> foundDoctorsInDepartment = <DoctorByDept>[].obs;
  Rx<UserModel?> userProfile = Rx<UserModel?>(null);
  Rx<DoctorModel?> anyDrProfile = Rx<DoctorModel?>(null);
  Rx<AgentModel?> agentProfile = Rx<AgentModel?>(null);
  RxList<SymptomData> symptoms = <SymptomData>[].obs;
  RxList<DepartmentData> departments = <DepartmentData>[].obs;
  var isSymptomsLoading = false.obs;
  var isDeptLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final appController = Get.find<AppController>();
    if (appController.usertype == 'doctor') {
      fetchDepartments();
      getAllSymptoms();
    }
    if (appController.usertype == 'user') {
      fetchAvailableDoctors();
      fetchDepartments();
      fetchUserProfile();
      getAllSymptoms();
    }
    if (appController.usertype == 'agent') {
      fetchAvailableDoctors();
      fetchDepartments();
      fetchAgentProfile();
      getAllSymptoms();
    }
  }

  Future<void> fetchDepartments() async {
    try {
      isDeptLoading.value = true;
      final response = await UserService.fetchDepartmentData();
      departments.value = response;
      update();
    } catch (e) {
      print(e.toString());
    } finally {
      isDeptLoading.value = false;
    }
  }

  Future<void> getAllSymptoms() async {
    try {
      isSymptomsLoading.value = true;
      symptoms.value = await UserService().fetchSymptoms();
      print(symptoms);
    } catch (e) {
      print(e.toString());
    } finally {
      isSymptomsLoading.value = false;
    }
  }

  Future<void> fetchAllDoctors() async {
    try {
      isAllDrLoading.value = true;

      final response = await UserService.fetchAllDoctors();
      doctors.value = response!;
      isAllDrLoading.value = false;
      update();
    } catch (e) {
      isAllDrLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> fetchAvailableDoctors() async {
    try {
      isAvailableDrLoading.value = true;

      final response = await UserService.fetchAvailableDoctors();
      availableDoctors.value = response!;
      isAvailableDrLoading.value = false;
      update();
    } catch (e) {
      isAvailableDrLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> fetchRandomDoctors() async {
    try {
      isRandomDrLoading.value = true;

      final response = await UserService.fetchRandomDoctors();
      randomDoctors.value = response!;
      isRandomDrLoading.value = false;
      update();
      print(doctors);
    } catch (e) {
      isRandomDrLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> fetchDoctorsByDept(int? departmentId) async {
    try {
      isDrByDeptLoading.value = true;

      final response = await UserService.getDoctorsByDepartment(departmentId);
      doctorsByDept.value = response!;
      isDrByDeptLoading.value = false;
      update();
    } catch (e) {
      isDrByDeptLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> fetchDoctorsBySymptom(int symptomId) async {
    print("IDSYMTOMS___${symptomId}");
    try {
      isDrBySymptomLoading.value = true;

      final response = await UserService.getDoctorsBySymptom(symptomId);
      doctorsBySymptom.value = response!;
      isDrBySymptomLoading.value = false;
      update();
    } catch (e) {
      isDrBySymptomLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> searchDoctorsInDrHome(String query) async {
    try {
      isSearchDrHomeLoading.value = true;

      if (query.isEmpty) {
        foundDoctorsInDrHome.clear();
      } else {
        final normalizedQuery = query.toLowerCase().trim();

        foundDoctorsInDrHome.value = doctors
            .where((doctor) =>
                doctor.name!.toLowerCase().contains(normalizedQuery) ||
                doctor.departments!.any((department) =>
                    department.name!.toLowerCase().contains(normalizedQuery)) ||
                doctor.symptoms!.any((symptom) =>
                    symptom.name!.toLowerCase().contains(normalizedQuery)))
            .toList();
      }

      isSearchDrHomeLoading.value = false;
    } catch (e) {
      isSearchDrHomeLoading.value = false;
      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> searchDoctorsAll(String query) async {
    try {
      isSearchDrAllLoading.value = true;

      if (query.isEmpty) {
        foundDoctorsAll.clear();
      } else {
        final normalizedQuery = query.toLowerCase().trim();

        foundDoctorsAll.value = doctors
            .where((doctor) =>
                doctor.name!.toLowerCase().contains(normalizedQuery) ||
                doctor.departments!.any((department) =>
                    department.name!.toLowerCase().contains(normalizedQuery)) ||
                doctor.symptoms!.any((symptom) =>
                    symptom.name!.toLowerCase().contains(normalizedQuery)))
            .toList();
      }

      isSearchDrAllLoading.value = false;
    } catch (e) {
      isSearchDrAllLoading.value = false;
      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> searchDoctorsInSymptom(String query) async {
    try {
      isSearchDrInDeptLoading.value = true;

      if (query.isEmpty) {
        foundDoctorsInSymptom.clear();
      } else {
        final normalizedQuery = query.toLowerCase().trim();

        foundDoctorsInSymptom.value = doctorsBySymptom
            .where((doctor) =>
                doctor.name!.toLowerCase().contains(normalizedQuery))
            .toList();
      }

      isSearchDrInSymptomLoading.value = false;
    } catch (e) {
      isSearchDrInSymptomLoading.value = false;
      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> searchDoctorsInDept(String query) async {
    try {
      isSearchDrInDeptLoading.value = true;

      if (query.isEmpty) {
        foundDoctorsInDepartment.clear();
      } else {
        final normalizedQuery = query.toLowerCase().trim();

        foundDoctorsInDepartment.value = doctorsByDept
            .where((doctor) =>
                doctor.name!.toLowerCase().contains(normalizedQuery))
            .toList();
      }

      isSearchDrInDeptLoading.value = false;
    } catch (e) {
      isSearchDrInDeptLoading.value = false;
      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> fetchUserProfile() async {
    try {
      isUserProfileLoading.value = true;
      final response = await UserService.fetchUserProfile();
      userProfile.value = response;
      isUserProfileLoading.value = false;
      update();
    } catch (e) {
      isUserProfileLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> fetchAnyDrProfile(int drId) async {
    try {
      isAnyDrProfileLoading.value = true;
      final response = await UserService.getAnyDoctorProfile(drId);
      anyDrProfile.value = response;
      print("Data--${anyDrProfile.value}");
      isAnyDrProfileLoading.value = false;
      update();
    } catch (e) {
      isAnyDrProfileLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> updateUserProfile({
    context,
    required String name,
    required String phone,
    required String gender,
    required String about,
    String? profile_pic,
    required String? counrtyId,
  }) async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      if (profile_pic != null) {
        await UserService().updateUserProfile(
          name: name,
          phone: phone,
          gender: gender,
          about: about,
          profile_pic: profile_pic,
          countryId: counrtyId!
        );
      } else {
        await UserService().updateUserProfile(
          name: name,
          phone: phone,
          gender: gender,
          about: about,
          countryId: counrtyId!
        );
      }
      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile update successful')));
    } catch (e) {
      Get.back();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile update failed: $e')));
      print(e.toString());
    }
  }

  Future<void> fetchAgentProfile() async {
    try {
      isAgentProfileDrLoading.value = false;
      final response = await UserService.getAgentProfile();
      agentProfile.value = response;
      isAgentProfileDrLoading.value = false;
      update();
    } catch (e) {
      isAgentProfileDrLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> updateAgentProfile({
    context,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String about,
    required String country_id,
    String? profile_pic,
  }) async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      if (profile_pic != null) {
        await UserService().updateAgentProfile(
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          about: about,
          profile_pic: profile_pic,
          country_id: country_id
        );
      } else {
        await UserService().updateAgentProfile(
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          about: about,
          country_id: country_id
        );
      }

      Get.back();
      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile update successful')));
    } catch (e) {
      Get.back();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile update failed: $e')));
      print(e.toString());
    }
  }

  void addReview(String doctorId, stars, reviewText, context) async {
    await UserService.addReview(doctorId, stars, reviewText, context);
    update();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Reviewed')));
  }

  void updateReview(String doctorId, stars, reviewText, context) async {
    await UserService.editReview(doctorId, stars, reviewText);
    update();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Updated')));
  }

  Future<void> fetchUserAgentUploadedPrescriptions() async {
    uploadedPrescriptionLoading.value = true;
    try {
      final response = await PrescriptionService.fetchUploadedPrescriptions();
      uploadedPrescriptionsList.value = response!;

      update();
      uploadedPrescriptionLoading.value = false;
    } catch (e) {
      uploadedPrescriptionLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> uploadPrescription(
      context, String photoPath, String descriptions) async {
    try {
      await PrescriptionService()
          .addPrescription(context, photoPath, descriptions);
      update();
    } catch (e) {
      print('Failed to add prescription: $e');
    }
  }

  Future<void> updatePrescription(
      context, int prescriptionId, String photoPath, descriptions) async {
    try {
      await PrescriptionService.updatePrescription(
          context, prescriptionId, photoPath, descriptions);
      print('Prescription updated successfully!');
    } catch (e) {
      print('Failed to update prescription: $e');
    }
  }

  Future<void> deletePrescription(context, int prescriptionId) async {
    try {
      await PrescriptionService().deletePrescription(context, prescriptionId);
      update();
    } catch (e) {
      print('Failed to delete prescription: $e');
    }
  }

  Future<void> sendPrescriptionToDoctor(
      int prescriptionId, int doctorId, context,int appointmentId) async {
    try {
      await PrescriptionService()
          .sendPrescriptionToDoctor(prescriptionId, doctorId,appointmentId);
      update();
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('Sent')));
      // print('Prescription sent to doctor successfully!');
    } catch (e) {
      print('Failed to send prescription to doctor: $e');
    }
  }
}
