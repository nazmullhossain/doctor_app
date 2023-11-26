
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget column;
  const CustomCard({Key? key, required this.column}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Card(

      elevation: 5,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: MediaQuery.of(context).size.width - 16,
        margin: const EdgeInsets.all(16),
        child:column
      ),
    );
  }
}
