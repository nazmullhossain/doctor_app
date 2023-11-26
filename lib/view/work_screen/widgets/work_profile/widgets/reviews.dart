import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app_controller.dart';
import '../../../../../controllers/dr_controller.dart';

class Reviews extends StatelessWidget {
   Reviews({Key? key}) : super(key: key);
  final AppController appController = Get.find();
   final DrController drController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        drController.doctorProfile.value!.data!.reviews!.isNotEmpty?
        Center(
          child: Stack(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 7,
                  color: Colors.orange,
                  backgroundColor: Colors.grey.shade300,
                  value:  5/drController.doctorProfile.value!.avgRatingStars!.toDouble(),
                ),
              ),
       Positioned(
                  left: 24,
                  top: 20,
                  child: Text(
                    drController.doctorProfile.value!.avgRatingStars ?? 0,
                    style:
                        TextStyle(fontSize: 22, color: Colors.orangeAccent),
                  )),
            ],
          ),
        ):Container(),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Reviews",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
   Row(
    children: [
    Icon(Icons.star,color: Colors.orangeAccent,size: 20,) , Text(drController.doctorProfile.value!.avgRatingStars.toString()),SizedBox(width: 4,),Text("(${drController.doctorProfile.value!.avgRatingStars??''})")
    ],),
        const SizedBox(height: 15,),

        drController.doctorProfile.value!.data!.reviews!.isNotEmpty?
        Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
          itemCount: drController.doctorProfile.value!.data!.reviews!.length,
          itemBuilder: (context, index) {
                var data = drController.doctorProfile.value!.data!.reviews![index];
            return ReviewCard(
                name: data.name,
                image: data.image,
                rating: drController.doctorProfile.value!.data!.reviews![index].stars,
                reviewText: drController.doctorProfile.value!.data!.reviews![index].
                reviewText);
          },
        )):Container()
      ],
    );
  }
}

