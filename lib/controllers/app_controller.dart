import 'package:doctor_app/api_services/auth_service.dart';
import 'package:doctor_app/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_services/user_service.dart';
import '../api_services/doctor_service.dart';
import '../api_services/prescription_service.dart';
import '../global_widgets/bottom_bar.dart';
import '../model/all_country_model.dart';
import '../model/appointment_schedule_model.dart';
import '../model/prescription_model.dart';
import '../view/landing_screen/landing_screen.dart';
import '../zego/zego_cloud.dart';
import 'package:http/http.dart' as http;

class AppController extends GetxController {
  RxString _token = ''.obs;
  RxString _usertype = ''.obs;
  String? get token => _token.value;
  String? get usertype => _usertype.value;

  var isLoading = false.obs;
  var isSlidersLoading = false.obs;

  var signInLoading = false.obs;
  var patientSchedule = ScheduleModel().obs;

  RxList<int> selectedSymptoms = <int>[].obs;

  RxList<int> selectedDepartments = <int>[].obs;
  RxBool isDarkMode = false.obs;
  RxList<SliderData> sliders = <SliderData>[].obs;
  RxString selectedAppointmentTime = ''.obs;
  RxInt selectedDay = RxInt(0);

  var countryLoader = false.obs;
  RxList<CountryList> countryList = <CountryList>[].obs;
  UserService userService = UserService();

  getdata() async {
    countryLoader.value = true;
    var api = await userService.getApicall();
    countryList.value = api!.data!;
    countryLoader.value = false;
    update();
  }


  final TextEditingController singleInviteeUserIDTextCtrl =
      TextEditingController();
  var id = "".obs;
  Future getdATA() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getId().then((value) {
      id.value = sharedPreferences.getString("id")!;
    });
  }

  @override
  void onInit() {
    super.onInit();
   // getdata();
    getAllSliders();
    getTokenFromSharedPreferences();
    getUserTypeFromSharedPreferences();
  }

  void selectTime(String time) {
    selectedAppointmentTime.value = time;
  }

  void selectDay(int day) {
    selectedDay.value = day;
  }

  void userTypeSet(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('usertypen', token);
  }

  void setId(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', token);
  }

  Future getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString('id');
  }

  void setName(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', token);
  }

  Future getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString('name');
  }

  void setPhone(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('phone', token);
  }

  Future getPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString('phone');
  }

  String? userId;
  String? name;
  String? phone;
  String? userType;

  Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    getId().then((value) {
      userId = sharedPreferences.getString("id");

      print("ID A${id}");

      getName().then((value) {
        name = sharedPreferences.getString("name");
        print("ID A${name}");
      });

      getPhone().then((value) {
        phone = sharedPreferences.getString("phone");
      });
    });
  }

  Future<void> performSignIn(
    context,
    String email,
    String password,
  ) async {
    try {
      print(usertype);
      final authService = AuthService();
      signInLoading.value = true;

      String token;

      if (usertype == 'doctor') {
        token = await authService.loginDoctor(email, password, context);
      } else if (usertype == 'agent') {
        token = await authService.loginAgent(email, password, context);
      } else if (usertype == 'user') {
        token = await authService.loginGeneralUser(email, password, context);
      } else {
        throw Exception('Invalid user type');
      }

      if (token.isNotEmpty) {
        final AppController appController = Get.find();
        appController.setToken(token);
        onUserLogin();
        Get.off(() => CustomBottomBar());
      } else {
        print('Failed to obtain token from login');
      }
    } catch (e) {
      print('Failed to perform sign-in: $e');
    } finally {
      signInLoading.value = false;
      update();
    }
  }

  Future<void> fetchSchedules() async {
    isLoading.value = true;
    final data = await DoctorService.fetchPatientAppointment();
    patientSchedule.value = data!;
    isLoading.value = false;
    update();
  }

  void toggleSymptomSelection(int symptomId) {
    if (selectedSymptoms.contains(symptomId)) {
      selectedSymptoms.remove(symptomId);
    } else {
      selectedSymptoms.add(symptomId);
    }
    update();
  }

  void toggleDepartmentSelection(int departmentId) {
    if (selectedDepartments.contains(departmentId)) {
      selectedDepartments.remove(departmentId);
    } else {
      selectedDepartments.add(departmentId);
    }
    update();
  }

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  //SharedPreference

  void setToken(String token) {
    _token.value = token;
    storeTokenInSharedPreferences(token);
  }

  void setUsertype(String userType) {
    _usertype.value = userType;
    storeUserTypeInSharedPreferences(userType);
  }

  Future<void> logout() async {
    await AuthService.logout().then((value) {
      Get.offAll(() => const LandingScreen());
    });
  }

  getTokenFromSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? storedToken = preferences.getString('token');
    if (storedToken != null) {
      _token.value = storedToken;
    }
  }

  void getUserTypeFromSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? storedUserType = preferences.getString('usertype');
    if (storedUserType != null) {
      _usertype.value = storedUserType;
    }
  }

  void storeTokenInSharedPreferences(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }

  void storeUserTypeInSharedPreferences(String userType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('usertype', userType);
  }

  //Data fetching

  Future<void> getAllSliders() async {
    try {
      isSlidersLoading.value = true;
      sliders.value = (await UserService().fetchSliders())!;
      update();
      isSlidersLoading.value = false;
      print(sliders);
    } catch (e) {
      isSlidersLoading.value = false;
      print(e.toString());
    }
  }

  Future<void> showSentPrescriptions() async {
    try {
      await PrescriptionService().showSentPrescriptions();
      update();
    } catch (e) {
      print('Failed to retrieve sent prescriptions: $e');
    }
  }

  //CRUD Operations
}
