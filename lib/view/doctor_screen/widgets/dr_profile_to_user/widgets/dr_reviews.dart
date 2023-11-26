import 'package:doctor_app/view/work_screen/widgets/work_profile/widgets/review_card.dart';
import 'package:flutter/material.dart';

import '../../../../../model/all_doctors.dart';

class DrReviews extends StatelessWidget {
  final DoctorsData allDoctorsData;
  DrReviews({Key? key, required this.allDoctorsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
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
                  value: 0.8,
                ),
              ),
              Positioned(
                  left: 24,
                  top: 20,
                  child: Text(
                    allDoctorsData.avgRatingStars.toString(),
                    style: TextStyle(fontSize: 22, color: Colors.orangeAccent),
                  )),
            ],
          ),
        ),
        const Text(
          "Reviews",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orangeAccent,
              size: 20,
            ),
            Text(allDoctorsData.avgRatingStars.toString()),
            SizedBox(
              width: 4,
            ),
            Text("(${allDoctorsData.reviews!.length})")
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: allDoctorsData.reviews!.length,
          itemBuilder: (context, index) {
            return ReviewCard(
                name: 'API Needed for user\'s name & image',
                image: reviews[index].image,
                rating: allDoctorsData.reviews![index].stars,
                reviewText: allDoctorsData.reviews![index].reviewText);
          },
        ))
      ],
    );
  }
}

List<ReviewCard> reviews = [
  const ReviewCard(
      name: "User",
      image: "assets/images/profile.png",
      rating: "5",
      reviewText: "Very good doctor. Saw me carefully and advised cordially"),
  const ReviewCard(
      name: "Another User",
      image: "assets/images/profile.png",
      rating: "4",
      reviewText: "Very good doctor. Saw me carefully and advised cordially"),
  const ReviewCard(
      name: "New User",
      image: "assets/images/profile.png",
      rating: "3",
      reviewText: "Very good doctor. Saw me carefully and advised cordially"),
  const ReviewCard(
      name: "Best User",
      image: "assets/images/profile.png",
      rating: "2",
      reviewText: "Very good doctor. Saw me carefully and advised cordially"),
];
