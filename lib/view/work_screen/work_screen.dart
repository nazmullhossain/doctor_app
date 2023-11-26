import 'package:doctor_app/controllers/user_controller.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/services_management.dart';
import 'package:doctor_app/view/work_screen/widgets/work_profile/work_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widgets/custom_box_card.dart';
import '../payment_sacreens/balance_screen.dart';
import '../payment_sacreens/payment_crud/payment_list_screen.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0,title:   Text("My Work",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),),
       body:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15,),
              Expanded(
                child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 4,
                        crossAxisCount: 2),

                 children: [
                   InkWell(onTap:(){Get.to(()=> WorkProfile());},child: const CustomBoxCard(text: "Profile Management", icon: "assets/images/wrk_prfl_mang.png")),
                   InkWell(onTap:(){Get.to(()=>const ServiceManagement());},child: const CustomBoxCard(text: "Service Management", icon: "assets/images/service_management.png")),
                   InkWell(
                       onTap: (){
                         // Get.to(PaymentListScreen());
                         Get.to(BalanceScreen());
                         //  Get.to(CashWithdrawalPage());

                       },
                       child: const CustomBoxCard(text: "Payment", icon: "assets/images/pay.png")),
                   const CustomBoxCard(text: "Appointment", icon: "assets/images/calendar.png"),

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
