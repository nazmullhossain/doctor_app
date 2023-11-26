import 'package:flutter/material.dart';

class DrCard extends StatelessWidget {
final String image,title;

  const DrCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(24),
          height: 80,
          width: 100,
          child: Image.network(
            image,
          ),
        ),
      ),
      Text(title)

    ],);
  }
}
