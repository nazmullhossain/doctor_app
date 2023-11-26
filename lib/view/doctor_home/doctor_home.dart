import 'package:doctor_app/notificatrion/notification_screen.dart';
import 'package:doctor_app/view/doctor_home/widgets/prescriptions_list_sent_by_users.dart';
import 'package:doctor_app/view/doctor_home/widgets/schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dr_controller.dart';
import '../../controllers/user_controller.dart';
import '../../global_widgets/custom_box_card.dart';
import '../../notificatrion/notification_controller.dart';
import '../consultation_details.dart';
import 'package:badges/badges.dart' as badges;

class DoctorHome extends StatelessWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DrController drController = Get.put(DrController());
    final UserController userController = Get.put(UserController());
    NotificationController notificationController = Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/slogan.jpg',
              width: 280,

            ),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: (){
              Get.to(NotificationScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,right: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,

                ),
                child: badges.Badge(
                  badgeContent: Text('${notificationController.count.value.data ??0}'),
                  child: Icon(Icons.notifications_outlined,size: 30,),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Tasks for today",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("5 of 8 completed"),
                    ],
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.green,
                          backgroundColor: Colors.grey.shade300,
                          value: 0.5,
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 20,
                        child: Text(
                          "5",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 500,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                       // Get.to(() => const ScheduleScreen());
                      },
                      child: const CustomBoxCard(
                        text: 'Schedule',
                        icon: 'assets/images/schedule.png',
                      ),
                    ),
                    const CustomBoxCard(
                      text: 'Consult History',
                      icon: 'assets/images/past.png',
                    ),
                    const CustomBoxCard(
                      text: 'Patient Management',
                      icon: 'assets/images/group-icon.png',
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const ConsultationForm());
                      },
                      child: InkWell(
                      onTap: ()=>Get.to(()=>PrescriptionsSentByUserScreen()),
                        child: const CustomBoxCard(
                          text: 'Medical Records',
                          icon: 'assets/images/test.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
