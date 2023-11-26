import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  setToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString("fcmtoken", token);
  }

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getString("fcmtoken");
  }
  setId(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString("id", token);
  }

  Future<String?> getId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getString("id");
  }
}