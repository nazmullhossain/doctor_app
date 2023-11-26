import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/app_controller.dart';
import '../../../../../controllers/dr_controller.dart';

class UpdateServiceTime extends StatefulWidget {
  final String instantCall, appointment;

  UpdateServiceTime({
    Key? key,
    required this.instantCall,
    required this.appointment,
  }) : super(key: key);

  @override
  _UpdateServiceTimeState createState() => _UpdateServiceTimeState();
}

class _UpdateServiceTimeState extends State<UpdateServiceTime> {
  final appController = Get.find<AppController>();
  final drController = Get.find<DrController>();

  late bool instantCallValue;
  late bool appointmentValue;

  late TextEditingController startDayInstantController;
  late TextEditingController endDayInstantController;
  late TextEditingController startTimeInstantController;
  late TextEditingController endTimeInstantController;
  late TextEditingController startDayScheduleController;
  late TextEditingController endDayScheduleController;
  late TextEditingController startTimeScheduleController;
  late TextEditingController endTimeScheduleController;

  @override
  void initState() {
    super.initState();
    instantCallValue = widget.instantCall == '1';
    appointmentValue = widget.appointment == '1';

    startDayInstantController = TextEditingController(
        text: drController.doctorProfile.value!.data?.startDayForInstant);
    endDayInstantController = TextEditingController(
        text: drController.doctorProfile.value!.data?.endDayForInstant);
    startTimeInstantController = TextEditingController(
        text: drController.doctorProfile.value!.data?.startTimeForInstant);
    endTimeInstantController = TextEditingController(
        text: drController.doctorProfile.value!.data?.endTimeForInstant);
    startDayScheduleController = TextEditingController(
        text: drController.doctorProfile.value!.data?.startDayForSchedule);
    endDayScheduleController = TextEditingController(
        text: drController.doctorProfile.value!.data?.endDayForSchedule);
    startTimeScheduleController = TextEditingController(
        text: drController.doctorProfile.value!.data?.startTimeForSchedule);
    endTimeScheduleController = TextEditingController(
        text: drController.doctorProfile.value!.data?.endTimeForSchedule);
  }

  @override
  void dispose() {
    startDayInstantController.dispose();
    endDayInstantController.dispose();
    startTimeInstantController.dispose();
    endTimeInstantController.dispose();
    startDayScheduleController.dispose();
    endDayScheduleController.dispose();
    startTimeScheduleController.dispose();
    endTimeScheduleController.dispose();
    super.dispose();
  }

  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<String> timesWith30MinutesIntervalAMPM = [
    '12:00 AM', '12:30 AM',
    '01:00 AM', '01:30 AM',
    '02:00 AM', '02:30 AM',
    '03:00 AM', '03:30 AM',
    '04:00 AM', '04:30 AM',
    '05:00 AM', '05:30 AM',
    '06:00 AM', '06:30 AM',
    '07:00 AM', '07:30 AM',
    '08:00 AM', '08:30 AM',
    '09:00 AM', '09:30 AM',
    '10:00 AM', '10:30 AM',
    '11:00 AM', '11:30 AM',
    '12:00 PM', '12:30 PM',
    '01:00 PM', '01:30 PM',
    '02:00 PM', '02:30 PM',
    '03:00 PM', '03:30 PM',
    '04:00 PM', '04:30 PM',
    '05:00 PM', '05:30 PM',
    '06:00 PM', '06:30 PM',
    '07:00 PM', '07:30 PM',
    '08:00 PM', '08:30 PM',
    '09:00 PM', '09:30 PM',
    '10:00 PM', '10:30 PM',
    '11:00 PM', '11:30 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('Update Info'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            height: 25,
            width: 25,
            child: const Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Service Type',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        value: instantCallValue,
                        onChanged: (value) {
                          setState(() {
                            instantCallValue = value ?? false;
                          });
                        },
                      ),
                      Text('Instant Call'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Checkbox(
                        value: appointmentValue,
                        onChanged: (value) {
                          setState(() {
                            appointmentValue = value ?? false;
                          });
                        },
                      ),
                      Text('Appointment'),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'Service Time',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: startDayInstantController.text.isNotEmpty
                              ? startDayInstantController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              startDayInstantController.text = newValue!;
                            });
                          },
                          items: days.map((day) {
                            return DropdownMenuItem<String>(
                              value: day,
                              child: Text(day),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Start Day for Instant',
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: startTimeInstantController.text.isNotEmpty
                              ? startTimeInstantController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              startTimeInstantController.text = newValue!;
                            });
                          },
                          items: timesWith30MinutesIntervalAMPM.map((time) {
                            return DropdownMenuItem<String>(
                              value: time,
                              child: Text(time),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Start Time for Instant',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: endDayInstantController.text.isNotEmpty
                              ? endDayInstantController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              endDayInstantController.text = newValue!;
                            });
                          },
                          items: days.map((day) {
                            return DropdownMenuItem<String>(
                              value: day,
                              child: Text(day),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'End Day for Instant',
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: endTimeInstantController.text.isNotEmpty
                              ? endTimeInstantController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              endTimeInstantController.text = newValue!;
                            });
                          },
                          items: timesWith30MinutesIntervalAMPM.map((time) {
                            return DropdownMenuItem<String>(
                              value: time,
                              child: Text(time),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'End Time for Instant',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: startDayScheduleController.text.isNotEmpty
                              ? startDayScheduleController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              startDayScheduleController.text = newValue!;
                            });
                          },
                          items: days.map((day) {
                            return DropdownMenuItem<String>(
                              value: day,
                              child: Text(day),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Start Day for Appointment',
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: startTimeScheduleController.text.isNotEmpty
                              ? startTimeScheduleController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              startTimeScheduleController.text = newValue!;
                            });
                          },
                          items: timesWith30MinutesIntervalAMPM.map((time) {
                            return DropdownMenuItem<String>(
                              value: time,
                              child: Text(time),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Start Time for Appointment',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: endDayScheduleController.text.isNotEmpty
                              ? endDayScheduleController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              endDayScheduleController.text = newValue!;
                            });
                          },
                          items: days.map((day) {
                            return DropdownMenuItem<String>(
                              value: day,
                              child: Text(day),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'End Day for Appointment',
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: endTimeScheduleController.text.isNotEmpty
                              ? endTimeScheduleController.text
                              : null,
                          onChanged: (newValue) {
                            setState(() {
                              endTimeScheduleController.text = newValue!;
                            });
                          },
                          items: timesWith30MinutesIntervalAMPM.map((time) {
                            return DropdownMenuItem<String>(
                              value: time,
                              child: Text(time),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'End Time for Appointment',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.cyanAccent,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () async {
                      final instantCall = instantCallValue ? '1' : '0';
                      final appointment = appointmentValue ? '1' : '0';

                      try {
                        await drController.updateServiceTime(
                          context,
                          start_day_for_instant: startDayInstantController.text,
                          end_day_for_instant: endDayInstantController.text,
                          start_time_for_instant: startTimeInstantController.text,
                          end_time_for_instant: endTimeInstantController.text,
                          start_day_for_schedule: startDayScheduleController.text,
                          end_day_for_schedule: endDayScheduleController.text,
                          start_time_for_schedule: startTimeScheduleController.text,
                          end_time_for_schedule: endTimeScheduleController.text,
                        );
                        await drController.updateService(
                          context,
                          instantCall: instantCall,
                          appointment: appointment,
                        );
                        drController.fetchDoctorProfile();
                      } catch (e) {
                        print('Error updating doctor information: $e');
                      }
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
