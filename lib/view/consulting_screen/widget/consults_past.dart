
import 'package:flutter/material.dart';

import 'consulting_card.dart';

class ConsultsPast extends StatelessWidget {
  const ConsultsPast ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Yesterday 06-20-23",style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index){return const ConsultingCard(name: 'Mr Man', type: 'Video Call', status: 'Completed', image: 'assets/images/profile.png', timeRange: '09:30 AM-10:00 AM',);}
          ),
        ),
      ],
    );
  }
}