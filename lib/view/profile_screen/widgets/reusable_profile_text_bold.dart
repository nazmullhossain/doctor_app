import 'package:flutter/material.dart';

class ProfileTextBold extends StatelessWidget {
final String text;

  const ProfileTextBold({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(text,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
    );
  }
}
