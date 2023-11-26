import 'dart:developer';

import 'package:doctor_app/view/consultation_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import 'consult_FORM2.dart';
import 'controllers/user_controller.dart';
import 'local_save.dart';

class AppointmentSelectionForm2 extends StatefulWidget {
  final int? id;

  final String? startDayForSchdule;
  final String? endDayForSchedule;

  final String? startDayForInstance;
  final String? endDayForInstance;

  final String? startTimeForSchdule;
  final String? endTimeForSchedule;

  final String? startTimeForInstant;
  final String? endTimeForInstant;

  final String? doctorID;
  final String? customerMsisdn;
  final String? paymentID;
  final String? trxID;
  final String? amount;
  final String? merchantInvoiceNumber;

  const AppointmentSelectionForm2(
      {super.key,
      this.startDayForSchdule,
      this.endDayForSchedule,
      this.startDayForInstance,
      this.endDayForInstance,
      this.startTimeForSchdule,
      this.endTimeForSchedule,
      this.startTimeForInstant,
      this.endTimeForInstant,
      this.doctorID,
      this.customerMsisdn,
      this.paymentID,
      this.trxID,
      this.amount,
      this.merchantInvoiceNumber,
      this.id});

  @override
  State<AppointmentSelectionForm2> createState() =>
      _AppointmentSelectionForm2State();
}

class _AppointmentSelectionForm2State extends State<AppointmentSelectionForm2> {
  final DateFormat _dateFormat = DateFormat().add_yMMMd();
  String? firebaseToken;

  getData() async {
    await SharedData().getToken().then((value) {
      firebaseToken = value;
      print("FCM__${firebaseToken}");
    });
  }

  List<String> _getDaysInRange(String startDay, String endDay) {
    List<String> weekdays = [
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
    ];

    int startIndex = weekdays.indexOf(startDay);
    int endIndex = weekdays.indexOf(endDay);

    if (startIndex <= endIndex) {
      return weekdays.sublist(startIndex, endIndex + 1);
    } else {
      List<String> daysInRange = weekdays.sublist(startIndex, weekdays.length);
      daysInRange.addAll(weekdays.sublist(0, endIndex + 1));
      return daysInRange;
    }
  }

  List<String> _generateTimeList222(String startTime, String endTime) {
    DateFormat format = DateFormat("h:mm a");
    DateTime start = format.parse(startTime);
    DateTime end = format.parse(endTime);

    List<String> timeList = [];

    if (end.isBefore(start)) {
      end =
          end.add(Duration(days: 1)); // Wraparound for times crossing midnight
    }

    DateTime current = start;

    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      String formattedTime = DateFormat("h:mm a").format(current);
      timeList.add(formattedTime);

      current = current.add(Duration(hours: 1));
    }

    return timeList;
  }

  int? selectedSchedule;
  String? selectedScheduleString;
  int? selectDate;
  String? selectDateString;
  int? selectedTime;
  String? selectedTimeString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    List<String> daysInRange = _getDaysInRange(
        widget.startDayForSchdule ?? "", widget.endDayForSchedule ?? "");

    List<String> timeList = _generateTimeList222(
      widget.startTimeForSchdule ?? "00:00",
      widget.endTimeForSchedule ?? "23:59",
    );

    final UserController userController = Get.find();
    userController.fetchAnyDrProfile(widget.id!);

    bool isLoading = false;
    final flutterBkash = FlutterBkash(
      bkashCredentials: BkashCredentials(
        username: "01756856885",
        password: "TMV&ku_XD4n",
        appKey: "kAPevqFeJ8J3yAldtE34cPkxtc",
        appSecret: "9cF2TbFV30Pd7UZThzPdmjm7AJyTSkCkTlP6x16jcq4S1NlAX1zX",
        isSandbox: false,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        elevation: 3,
        title: Text('Appointment Form'),
      ),
      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Select Day",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 7,
                    itemBuilder: (_, index) {
                      final DateTime currentDate =
                          DateTime.now().add(Duration(days: index));

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectDate = index;
                            selectDateString = _dateFormat.format(currentDate);
                            print("OKK__${selectDateString}");
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18.0, left: 19),
                                child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: selectDate == index
                                          ? Colors.indigo
                                          : Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "${_dateFormat.format(currentDate)}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 5 / 4),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Start Day for Schedule",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "End Day for Schedule",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: daysInRange.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSchedule = index;
                            selectedScheduleString = daysInRange[index];
                            print("OK#__${selectedScheduleString}");
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18.0, left: 19),
                                child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: selectedSchedule == index
                                          ? Colors.indigo
                                          : Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "${daysInRange[index]}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 6 / 3),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text(
                  //       "Start Day for Instance",
                  //       style: TextStyle(
                  //           fontSize: 17,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     Text(
                  //       "End Day for Instance",
                  //       style: TextStyle(
                  //           fontSize: 17,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ],
                  // ),
                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   primary: false,
                  //   itemCount: instance.length,
                  //   itemBuilder: (_, index) {
                  //     return Container(
                  //       child: InkWell(
                  //         onTap: (){
                  //           setState(() {
                  //             selectedDayInstace = index;
                  //           });
                  //         },
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding:
                  //                   const EdgeInsets.only(top: 18.0, left: 19),
                  //               child: Container(
                  //                 width: 100,
                  //                 padding: EdgeInsets.all(10),
                  //                 alignment: Alignment.center,
                  //                 decoration: BoxDecoration(
                  //                     color: selectedDayInstace==index ? Colors.indigo: Colors.blueGrey,
                  //                     borderRadius: BorderRadius.circular(10)),
                  //                 child: Text(
                  //                   "${instance[index]}",
                  //                   style: TextStyle(
                  //                       fontSize: 16, color: Colors.white),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 3, childAspectRatio: 6 / 3),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Start Time for Schedule",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "End Time for Schedule",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: timeList.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTime = index;
                            selectedTimeString = timeList[index];
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18.0, left: 19),
                                child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: selectedTime == index
                                          ? Colors.indigo
                                          : Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "${timeList[index]}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 6 / 3),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text("Start Time for Instance"),
                  //     Text("End Time for Instance"),
                  //   ],
                  // ),
                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   primary: false,
                  //   itemCount: intanceTime.length,
                  //   itemBuilder: (_, index222) {
                  //     return InkWell(
                  //       onTap: (){
                  //         setState(() {
                  //           selectedTimeInstance= index222;
                  //         });
                  //       },
                  //       child: Container(
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding:
                  //                   const EdgeInsets.only(top: 18.0, left: 19),
                  //               child: Container(
                  //                 width: 100,
                  //                 padding: EdgeInsets.all(10),
                  //                 alignment: Alignment.center,
                  //                 decoration: BoxDecoration(
                  //                     color: selectedTimeInstance==index222 ? Colors.indigo : Colors.blueGrey,
                  //                     borderRadius: BorderRadius.circular(10)),
                  //                 child: Text(
                  //                   "${intanceTime[index222]}",
                  //                   style: TextStyle(
                  //                       fontSize: 16, color: Colors.white),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 3, childAspectRatio: 6 / 3),
                  // ),
                  SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: SizedBox(
                      height: 45,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (selectDateString == "" ||
                              selectDateString == null) {
                            Get.snackbar(
                              "Error",
                              "Please select your day",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          } else if (selectedTimeString == "" ||
                              selectedTimeString == null) {
                            Get.snackbar(
                              "Error",
                              "Please select your time",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          } else if (selectedScheduleString == "" ||
                              selectedScheduleString == null) {
                            Get.snackbar(
                              "Error",
                              "Please select your day of Schdule",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          } else {
                            final data =
                                await userController.anyDrProfile.value!.data!;

                            // print("FEE__${data.info!.consultationFee!.toDouble()}");

                            setState(() {
                              isLoading = true;
                            });
                            try {
                              print(
                                  "FEE__${data.info!.consultationFee!.toDouble()}");
                              final result = await flutterBkash.pay(
                                context: context,
                                amount: userController.anyDrProfile.value!.data!
                                    .info!.consultationFee!
                                    .toDouble(),
                                merchantInvoiceNumber: "tranId",
                              );
                              if (result == null) {
                                setState(() {
                                  isLoading = false;
                                });
                                _showSnackbar('Please wait while...', context);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                print('You are ready for go');
                                log(result.toString());
                                _showSnackbar(
                                    "(Success) tranId: ${result.trxId}",
                                    context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ConsultationForm2(
                                      doctorID: data.id.toString(),
                                      customerMsisdn: result.customerMsisdn,
                                      amount:
                                          data.info!.consultationFee.toString(),
                                      merchantInvoiceNumber:
                                          result.merchantInvoiceNumber,
                                      paymentID: result.paymentId,
                                      trxID: result.trxId,
                                      time: selectedTimeString.toString() +
                                          selectedScheduleString.toString() +
                                          selectDateString.toString(),
                                    ),
                                  ),
                                );
                              }
                            } on BkashFailure catch (e, st) {
                              setState(() {
                                isLoading = false;
                              });
                              log(e.message, error: e, stackTrace: st);
                              _showSnackbar(e.message, context);
                            } catch (e, st) {
                              setState(() {
                                isLoading = false;
                              });
                              log("Something went wrong",
                                  error: e, stackTrace: st);
                              _showSnackbar("Something went wrong", context);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Center(
                          child: Text(
                            'Confirm Booking',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showSnackbar(String message, context) => ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(SnackBar(content: Text(message)));
