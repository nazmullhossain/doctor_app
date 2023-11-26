import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import 'count_model.dart';
import 'notification_model.dart';
import 'package:http/http.dart'as http;
class Notifcationrepo {

  Future<Count?> getData() async {
    AppController appController = Get.find();

    String? token = await appController.token;
    print("TOKEN__${token}");
    var response = await http.get(
      Uri.parse("https://treatmenticwl.com/api/notifications/count"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      return countFromJson(response.body);
    } else {

    }
  }
}


