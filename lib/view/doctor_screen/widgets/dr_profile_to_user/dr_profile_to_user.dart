import 'dart:convert';
import 'package:doctor_app/appointment_schdule.dart';
import 'package:doctor_app/model/all_doctors.dart';
import 'package:doctor_app/view/appointment_selection_form.dart';
import 'package:doctor_app/view/consultation_details.dart';
import 'package:doctor_app/view/doctor_screen/widgets/dr_profile_to_user/widgets/about_dr.dart';
import 'package:doctor_app/view/doctor_screen/widgets/dr_profile_to_user/widgets/dr_reviews.dart';
import 'package:doctor_app/view/doctor_screen/widgets/dr_profile_to_user/widgets/experience.dart';
import 'package:doctor_app/view/doctor_screen/widgets/dr_profile_to_user/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import '../../../../consult_FORM2.dart';
import '../../../../controllers/user_controller.dart';

class DrProfileToUser extends StatefulWidget {
  final DoctorsData doctorsData;
  const DrProfileToUser({Key? key, required this.doctorsData})
      : super(key: key);

  @override
  State<DrProfileToUser> createState() => _DrProfileToUserState();
}

class _DrProfileToUserState extends State<DrProfileToUser> {
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
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    userController.fetchAnyDrProfile(widget.doctorsData.id!);
    print("ID)))___${widget.doctorsData.id!}");

    Future<void> reloadData() async {
      userController.fetchAnyDrProfile(widget.doctorsData.id!);
    }

    return SafeArea(
      child: Scaffold(
        body: isLoading == true
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(
                        'Please wait a while, we are processing your request',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                      height: 170,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff0043ba),
                                      Color(0xff006df1)
                                    ]),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(widget.doctorsData
                                                  .profilePhotoUrl ??
                                              'https://cdn.pixabay.com/photo/2017/05/15/23/47/stethoscope-icon-2316460_1280.png')),
                                    ),
                                  ),
                                  widget.doctorsData.status == true
                                      ? Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            child: Container(
                                              margin: const EdgeInsets.all(8.0),
                                              decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  shape: BoxShape.circle),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: IconButton(
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
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.doctorsData.name!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: SizedBox(
                                child: DrProfileToUserTabBar(
                                    tab1: SingleChildScrollView(
                                        child: SizedBox(
                                            // height: 600,
                                            child: AboutDr(
                                              doctorsData: widget.doctorsData,
                                            ))),
                                    tab2: SingleChildScrollView(
                                        child: SizedBox(
                                            height: 600,
                                            child: DrExperience(
                                              allDoctorsData:
                                                  widget.doctorsData,
                                            ))),
                                    tab3: SingleChildScrollView(
                                        child: SizedBox(
                                            height: 600,
                                            child: DrReviews(
                                              allDoctorsData:
                                                  widget.doctorsData,
                                            ))),
                                    tab1Name: "About Dr",
                                    tab2Name: 'Dr. Experience',
                                    tab3Name: 'Reviews')),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Consultation Fee'),
                            Text(
                              "৳ ${widget.doctorsData.info?.consultationFee ?? ''}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 25,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final data = await userController
                                      .anyDrProfile.value!.data!;

                                  setState(() {
                                    isLoading = true;
                                  });

                                  try {
                                    final result = await flutterBkash.pay(
                                      context: context,
                                      amount: double.parse(widget
                                          .doctorsData.info!.consultationFee
                                          .toString()),
                                      merchantInvoiceNumber: "tranId",
                                    );
                                    if (result == null) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      _showSnackbar(
                                          'Please wait while...', context);
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      print('You are ready for go');
                                      dev.log(result.toString());
                                      _showSnackbar(
                                          "(Success) tranId: ${result.trxId}",
                                          context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ConsultationForm(
                                            doctorID: data.id.toString(),
                                            customerMsisdn:
                                                result.customerMsisdn,
                                            amount: widget.doctorsData.info!
                                                .consultationFee
                                                .toString(),
                                            merchantInvoiceNumber:
                                                result.merchantInvoiceNumber,
                                            paymentID: result.paymentId,
                                            trxID: result.trxId,
                                            schedule: "0",
                                          ),
                                        ),
                                      );
                                    }
                                  } on BkashFailure catch (e, st) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    dev.log(e.message,
                                        error: e, stackTrace: st);
                                    _showSnackbar(e.message, context);
                                  } catch (e, st) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    dev.log("Something went wrong",
                                        error: e, stackTrace: st);
                                    _showSnackbar(
                                        "Something went wrong", context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                child: const Center(
                                  child: Text(
                                    'Consult Now',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 25,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () async {

                                  Fluttertoast.showToast(
                                      msg: "Coming Soon...",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                  // final data = await userController
                                  //     .anyDrProfile.value!.data!;
                                  //
                                  // Get.to(() => AppointmentSelectionForm2(
                                  //       startDayForSchdule:
                                  //           data.startDayForSchedule,
                                  //       endDayForSchedule:
                                  //           data.endDayForSchedule,
                                  //       startTimeForInstant:
                                  //           data.startTimeForInstant,
                                  //       endTimeForInstant:
                                  //           data.endTimeForInstant,
                                  //       startDayForInstance:
                                  //           data.startDayForInstant,
                                  //       endDayForInstance:
                                  //           data.endDayForInstant,
                                  //       startTimeForSchdule:
                                  //           data.startTimeForSchedule,
                                  //       endTimeForSchedule:
                                  //           data.endTimeForSchedule,
                                  //       doctorID: data.id.toString(),
                                  //       amount: data.info!.consultationFee
                                  //           .toString(),
                                  //       id: data.id,
                                  //     ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: const Center(
                                  child: Text(
                                    'Book Appointment',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
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

void _showSnackbar(String message, context) => ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(SnackBar(content: Text(message)));
