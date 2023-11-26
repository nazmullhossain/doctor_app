import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/online_appointment.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/send_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceManagement extends StatelessWidget {
  const ServiceManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              height: 25,
              width: 25,
              child: const Icon(
                Icons.navigate_before,
                color: Colors.black,
              ),
            ),
          ),
          title: Text(
            "Services Manager",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const SendMessages());
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.cyan,
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Send Message",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.visible,
                            ),
                            Text(
                              "Send multiple messages from here. Get reply within 4 hours",
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Starting from 20"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: 70,
                margin: const EdgeInsets.all(12),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.video_chat,
                      color: Colors.cyan,
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Video/voice/live chat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.visible,
                          ),
                          Expanded(
                            child: Text(
                              "Send multiple messages from here. Get reply within 4 hours",
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Starting from 20"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const OnlineAppointment());
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.cyan,
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Online Appointment",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.visible,
                            ),
                            Text(
                              "Send multiple messages from here. Get reply within 4 hours",
                              overflow: TextOverflow.visible,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Starting from 20"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
