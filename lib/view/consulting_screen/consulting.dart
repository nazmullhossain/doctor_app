import 'package:doctor_app/view/consulting_screen/widget/consulting_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultingScreen extends StatelessWidget {
  const ConsultingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 36,width: MediaQuery.of(context).size.width-100,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 12),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.tune),
                  ),
                ],
              ),
              Expanded(
                child: const ConsultingTabBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
