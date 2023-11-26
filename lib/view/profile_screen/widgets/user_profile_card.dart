import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
 final String image,text;

  const UserProfileCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color:Colors.white54,child: Center(child: SizedBox(height: 110,width: 100,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image),
          ),)),),
        Text(text)

      ],
    );
  }
}
