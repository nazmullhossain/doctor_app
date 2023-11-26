 import 'package:flutter/material.dart';

  class SchduleDetailsScreen extends StatefulWidget {
    const SchduleDetailsScreen({super.key});

    @override
    State<SchduleDetailsScreen> createState() => _SchduleDetailsScreenState();
  }

  class _SchduleDetailsScreenState extends State<SchduleDetailsScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Schedule Details Screen"),
        ),
      );


    }
  }
