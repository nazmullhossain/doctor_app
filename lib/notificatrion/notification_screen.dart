import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/notificatrion/notification_model.dart';
import 'package:doctor_app/view/Precsciption/my_prescription.dart';
import 'package:doctor_app/view/Schdule_details/schdule_details_screen.dart';
import 'package:doctor_app/view/consulting_screen/consulting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:get/route_manager.dart';

import '../view/doctor_home/widgets/prescriptions_list_sent_by_users.dart';
import '../view/doctor_home/widgets/schedule.dart';
import 'notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool loader = false;
  NotificationModel? notificationModel;
  AppController appController = Get.put(AppController());
  Future<NotificationModel?> getData() async {
    setState(() {
      loader = true;
    });
    String? token = appController.token;
    var response = await http.get(
      Uri.parse("https://treatmenticwl.com/api/notifications"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      setState(() {
        loader = false;
        notificationModel = notificationModelFromJson(response.body);
      });
    } else {
      setState(() {
        loader = false;
      });
    }
    return notificationModel;
  }

  NotificationController notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Notification"),
      ),
      body: loader
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            )
          : notificationModel!.data!.isEmpty
              ? Center(
                  child: Text(
                    "No Notification Found",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: notificationModel!.data!.length,
                  itemBuilder: (_, index) {
                    var data = notificationModel!.data![index];
                    // DateTime createdAt = data.createdAt!;
                    // DateTime now = DateTime.now();
                    // Duration difference = now.difference(createdAt);
                    //
                    // String timeAgo = '';
                    //
                    // if (difference.inMinutes < 1) {
                    //   timeAgo = 'Just now';
                    // } else if (difference.inHours < 1) {
                    //   timeAgo = '${difference.inMinutes} min ago';
                    // } else if (difference.inDays < 1) {
                    //   timeAgo = '${difference.inHours} hr ago';
                    // } else {
                    //   timeAgo = DateFormat.yMMMd().add_jm().format(createdAt);
                    // }
                    DateTime dateTime = data.createdAt!;

                    // Define the desired date and time format
                    DateFormat dateFormat = DateFormat.yMMMd(); // For example: Sep 27, 2023
                    DateFormat timeFormat = DateFormat.Hm();    // For example: 09:27 AM

                    // Format the date and time separately
                    String formattedDate = dateFormat.format(dateTime);
                    String formattedTime = timeFormat.format(dateTime);

                    print('Formatted Date: $formattedDate');
                    print('Formatted Time: $formattedTime');
                    return Card(
                      color: data.readAt == null ? Colors.indigo : Colors.white,
                      elevation: 2,
                      child: ListTile(
                        onTap: () {
                          if (data.data!.type == "consult") {
                            Get.to(ConsultingScreen());
                          } else if (data.data!.type == "appointment") {
                           // Get.to(ScheduleScreen());
                          } else if (data.data!.type == "doctor_prescription") {
                            Get.to(MyPrescriptionScreen());
                          } else if (data.data!.type == "user_agent_test_report") {
                            Get.to(PrescriptionsSentByUserScreen());
                          }
                          markasread(data.id.toString()).then((value) {
                            getData();
                          });
                        },
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "${data.data!.type}".capitalizeFirst.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: data.readAt == null
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                          child: Text(
                            "${data.data!.body}",
                            style: TextStyle(
                                color: data.readAt == null
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        trailing: SizedBox(
                            child: Text(
                          "${data.time}",
                          style: TextStyle(
                              color: data.readAt == null
                                  ? Colors.white
                                  : Colors.black),
                        )),
                      ),
                    );
                  },
                ),
    );
  }

  Future markasread(String id) async {
    AppController appController = Get.put(AppController());
    String? token = await appController.token;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET',
        Uri.parse('https://treatmenticwl.com/api/notifications/mark-read/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      notificationController.getData();
    } else {
      print(response.reasonPhrase);
    }
  }
}
