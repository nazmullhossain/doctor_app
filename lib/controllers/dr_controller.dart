import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/doctor_service.dart';
import '../api_services/prescription_service.dart';
import '../model/doctor_model.dart';
import '../model/prescription_sent_to_dr.dart';
import '../model/prescription_sent_to_dr.dart';
import '../model/prescription_sent_to_dr.dart';

class DrController extends GetxController {
  Rx<DoctorModel?> doctorProfile = Rx<DoctorModel?>(null);
  // Rx<Education?> doctorEducation = Rx<Education?>(null);
  // Rx<Experience?> doctorExperience = Rx<Experience?>(null);
  Rx<Info?> doctorFees = Rx<Info?>(null);
  var drProfileIsLoading = false.obs;
  var drEduIsLoading = false.obs;
  var drExpIsLoading = false.obs;
  var drFeesIsLoading = false.obs;
  var isPrescriptionFromUserLoading = false.obs;
  var isSearchPrescriptionLoading = false.obs;
  RxList<PrescriptionsData> filteredPrescriptions =
      <PrescriptionsData>[].obs;
  RxList<PrescriptionsData> prescriptionsListFromUser =
      <PrescriptionsData>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchDoctorProfile();
    fetchPrescriptionsFromUsers();
  }

  Future<void> filterPrescriptions(String query) async {
    try {
      isSearchPrescriptionLoading.value = true;

      if (query.isEmpty) {
        filteredPrescriptions.clear();
      } else {
        final normalizedQuery = query.toLowerCase().trim();

        filteredPrescriptions.value = prescriptionsListFromUser
            .where((prescription) =>
                prescription.userAgent!.name.toString().toLowerCase()
                    .contains(normalizedQuery) ||
                prescription.userAgent!.id.toString().contains(normalizedQuery))
            .toList();
      }

      isSearchPrescriptionLoading.value = false;
    } catch (e) {
      isSearchPrescriptionLoading.value = false;
      print(e.toString());
    } finally {
      update();
    }
  }

  Future<void> fetchDoctorProfile() async {
    drProfileIsLoading.value = true;
    try {
      final response = await DoctorService.fetchDoctorProfile();
      doctorProfile.value = response;
      drProfileIsLoading.value = false;
      update();
      print(doctorProfile.value);
    } catch (e) {
      drProfileIsLoading.value = false;
      print(e.toString());
    }
  }

  // Future<void> fetchDoctorEducation() async {
  //   drEduIsLoading.value = true;
  //   try {
  //     final response = await DoctorService.fetchDoctorEducations();
  //     doctorEducation.value = response;
  //     drEduIsLoading.value = false;
  //     update();
  //
  //   } catch (e) {
  //     drEduIsLoading.value  = false;
  //     print(e.toString());
  //   }
  // }
  Future<void> fetchDoctorFees() async {
    drFeesIsLoading.value = true;
    try {
      final response = await DoctorService.fetchDoctorFees();
      doctorFees.value = response;
      drFeesIsLoading.value = false;
      update();
    } catch (e) {
      drFeesIsLoading.value = false;
      print(e.toString());
    }
  }
  // Future<void> fetchDoctorExperience() async {
  //   drExpIsLoading.value = true;
  //   try {
  //     final response = await DoctorService.fetchDoctorExperience();
  //     doctorExperience.value = response;
  //     drExpIsLoading.value = false;
  //     update();
  //
  //
  //   } catch (e) {
  //     drExpIsLoading.value  = false;
  //     print(e.toString());
  //   }
  // }

  Future<void> fetchPrescriptionsFromUsers() async {
    isPrescriptionFromUserLoading.value = true;
    try {
      final response = await PrescriptionService.prescriptionsSentByUsersToDr();
      prescriptionsListFromUser.value = response!;

      isPrescriptionFromUserLoading.value = false;
      update();
    } catch (e) {
      isPrescriptionFromUserLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> addExperience(String designation, departmentId, employmentStatus,
      period, working_place, context) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.addExperience(
        designation: designation,
        employmentStatus: employmentStatus,
        period: period,
        departmentId: departmentId,
        working_place: working_place,
      );

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Added Successfully')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to add')));
      print(e.toString());
    }
  }

  Future<void> updateExperience(designation, departmentId, employmentStatus,
      period, working_place, context, int experience_id) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.updateExperience(
          department_id: departmentId,
          designation: designation,
          employmentStatus: employmentStatus,
          period: period,
          working_place: working_place,
          experience_id: experience_id);

      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated Successfully')));

      update();
    } catch (e) {
      Get.back();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to update')));
      print(e.toString());
    }
  }

  Future<void> deleteExperience(int experience_id, context) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.deleteExperience(context, experience_id);

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Deleted Successfully')));
    } catch (e) {
      Get.back();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to delete')));
      print(e.toString());
    }
  }

  Future<void> updateStatus(String status, context) async {
    try {
      await DoctorService.updateStatus(status);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated Successfully')));
      update();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Status update failed: $e')));
    }
  }

  Future<void> addEducation(
      String degree, institute_name, passing_year, context) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.addDoctorEducations(context,
          degree: degree,
          institute_name: institute_name,
          passing_year: passing_year);

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Added')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error adding education: $e')));
    }
  }

  Future<void> updateEducation(context,
      {required String degree,
      required institute_name,
      required passing_year,
      required int education_id}) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.updateDoctorEducations(context,
          degree: degree,
          institute_name: institute_name,
          passing_year: passing_year,
          education_id: education_id);

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating education: $e')));
    }
  }

  Future<void> deleteEducation(int education_id, context) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.deleteEducation(context, education_id);

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Deleted Successfully')));
    } catch (e) {
      Get.back();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to delete')));
      print(e.toString());
    }
  }

  Future<void> updateProfile({
    context,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String about,
    required String bmdcNo,
    String? profilePicPath,
    required String ? countryId
  }) async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      if (profilePicPath != null) {
        await DoctorService().updateProfile(
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          about: about,
          bmdcNo: bmdcNo,
          profilePicPath: profilePicPath,
          countryId: countryId
        );
      } else {
        await DoctorService().updateProfile(
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          about: about,
          bmdcNo: bmdcNo,
          countryId: countryId
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

  Future<void> updateService(
    context, {
    required String instantCall,
    required String appointment,
  }) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.updateService(
        instantCall: instantCall,
        appointment: appointment,
      );

      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Update successful')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed ${e.toString}')));
    }
  }

  Future<void> updateServiceTime(
    context, {
    required String start_day_for_instant,
    required String end_day_for_instant,
    required String start_time_for_instant,
    required String end_time_for_instant,
    required String start_day_for_schedule,
    required String end_day_for_schedule,
    required String start_time_for_schedule,
    required String end_time_for_schedule,
  }) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.updateServiceTime(
        start_day_for_instant: start_day_for_instant,
        end_day_for_instant: end_day_for_instant,
        start_time_for_instant: start_time_for_instant,
        end_time_for_instant: end_time_for_instant,
        start_day_for_schedule: start_day_for_schedule,
        end_day_for_schedule: end_day_for_schedule,
        start_time_for_schedule: start_time_for_schedule,
        end_time_for_schedule: end_time_for_schedule,
      );

      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Update successful')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed ${e.toString}')));
    }
  }

  Future<void> setDepartment(String departmentId, context) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.setDepartments(departmentId);

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error setting department: $e')));
    }
  }

  Future<void> setSymptom(String symptomId, context) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.setSymptoms(symptomId);

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error setting symptom: $e')));
    }
  }

  Future<void> updateDoctorInformation(
    context, {
    required String consultationFee,
    required String followUpFee,
  }) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.updateDoctorInformation(
        context,
        consultationFee: consultationFee,
        followUpFee: followUpFee,
      );

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Created')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Created')));
      print(e.toString());
    }
  }

  Future<void> NewupdateDoctorInformation(
      context, {
        required String consultationFee,
        required String followUpFee,
      }) async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await DoctorService.newupdateDoctorInformation(
        context,
        consultationFee: consultationFee,
        followUpFee: followUpFee,
      );

      Get.back();

      update();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated')));
    } catch (e) {
      Get.back();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated')));
      print(e.toString());
    }
  }
}
