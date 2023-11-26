import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';

class CustomBoxCard extends StatelessWidget {
  final String text,icon;
  const CustomBoxCard({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appController.usertype == 'doctor'?Image.asset(icon,height: 50,width: 50,):Image.network(icon,height: 35,width: 30,),
            const SizedBox(height: 4,),
            Text(text,maxLines:2,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 12),)
          ],),
      ),
    );
  }
}
