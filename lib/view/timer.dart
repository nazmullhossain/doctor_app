import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:get/get_core/src/get_main.dart';

class TimerScreen extends StatefulWidget {
  @override
  TimerScreenState createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  int _secondsRemaining = 10 * 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();

      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text("Timer"),
          automaticallyImplyLeading: false,
          elevation:0,backgroundColor: Colors.cyan,
          leading: IconButton(onPressed: (){Get.back();}, icon: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.grey),height:25,width:25,child: const Icon(Icons.navigate_before,color: Colors.black,)))),
      body: Center(
        child: Text(
          formatTime(_secondsRemaining),
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TimerScreen(),
  ));
}
