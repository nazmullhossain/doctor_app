import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrescriptionDetailsScreen extends StatelessWidget {
  final String photoUrl;
  final String description;

  const PrescriptionDetailsScreen({
    required this.photoUrl,
    required this.description, required int prescriptionId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey),
                height: 25,
                width: 25,
                child: const Icon(
                  Icons.navigate_before,
                  color: Colors.black,
                ))),
        title: Text('Prescription Details'),
      ),
      body: Column(
        children: [
          Image.network(photoUrl),
          SizedBox(height: 12),
          Container(margin:EdgeInsets.symmetric(horizontal: 10),child: Text(description)),
        ],
      ),
    );
  }
}
