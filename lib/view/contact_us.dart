import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text(
                'Treatment-চিকিৎসা',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text(
                '+88 01733 318 088',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'J&J Tower, 0750-A-01, Chhoto Chowrasta,',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Town Kalikapur, Patuakhali-8600,',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Patuakhali, Bangladesh',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
