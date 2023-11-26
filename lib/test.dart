import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NextSevenDaysPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Seven Days'),
      ),
      body: Center(
        child: NextSevenDaysList(),
      ),
    );
  }
}

class NextSevenDaysList extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat('EEE, MMM dd');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        final DateTime currentDate = DateTime.now().add(Duration(days: index));
        return ListTile(
          title: Text(_dateFormat.format(currentDate)),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NextSevenDaysPage(),
  ));
}
