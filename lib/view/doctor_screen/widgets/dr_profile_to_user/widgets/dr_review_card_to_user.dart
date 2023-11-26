import 'package:flutter/material.dart';

class DrReviewCardToUser extends StatelessWidget {
  final String name,image,rating,reviewText;
  const DrReviewCardToUser({Key? key, required this.name, required this.image, required this.rating, required this.reviewText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation:5,child:Container(
      margin: const EdgeInsets.all(8),
      child: Column(children: [
        Row(
          children: [
          ClipRRect(borderRadius:BorderRadius.circular(8),child: Image.asset(image,height: 25,width: 25,)),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(name),
            Row(
              children: [
              const Icon(Icons.star,color: Colors.orangeAccent,size: 20,),Text(rating)
            ],)

          ],)
        ],),
        const SizedBox(height: 10,),
        Text(reviewText)
      ],),
    ));
  }
}
