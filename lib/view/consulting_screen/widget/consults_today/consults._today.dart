import 'package:doctor_app/call_end_page.dart';
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/model/appointment_schedule_model.dart';
import 'package:doctor_app/view/doctor_screen/widgets/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../consulting_card.dart';

class ConsultsToday extends GetView<AppController> {
  const ConsultsToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Datum>? userData = [];
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.singleInviteeUserIDTextCtrl.text = controller.id.value;
      controller.fetchSchedules();
    });
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.patientSchedule.value.data!.length,
                  itemBuilder: (context, index) {
                    final data = controller.patientSchedule.value.data![index];
                    userData = controller.patientSchedule.value.data;
                    DateTime createdAt = data.createdAt!;
                    DateTime now = DateTime.now();
                    Duration difference = now.difference(createdAt);

                    String timeAgo = '';

                    if (difference.inMinutes < 1) {
                      timeAgo = 'Just now';
                    } else if (difference.inHours < 1) {
                      timeAgo = '${difference.inMinutes} min ago';
                    } else if (difference.inDays < 1) {
                      timeAgo = '${difference.inHours} hr ago';
                    } else {
                      timeAgo = DateFormat.yMMMd().add_jm().format(createdAt);
                    }
                    // dataSetter(controller.patientSchedule.value.data!, index);
                    if (data.isScheduled == 0) {
                      return ConsultingCard(
                        instantCall: true,
                        name: data.appointmentable!.name!,
                        type: 'Video Call',

                        status: ' ${timeAgo}',
                        image: 'assets/images/profile.png',
                        color: data.isScheduled == 0 &&
                            data.callAvailability ==
                                true ? Colors.green : Colors.grey,
                        timeRange: "${data.time ??""}",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: Container(
                                      height: size.height * .5,
                                      padding: EdgeInsets.zero,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // BoldText(
                                                  //     text:
                                                  //         'User Details ${data.appointmentable!.id}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: size.width * .9,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ListTile(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        leading: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          backgroundImage:
                                                              AssetImage(
                                                            'assets/images/profile-icon.png',
                                                          ),
                                                        ),
                                                        title: Text(
                                                          data.appointmentable!
                                                              .name!,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Email: ${data.appointmentable!.email}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Phone: ${data.appointmentable!.phone}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  BoldText(
                                                      text:
                                                          'Consultation Details')
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: size.width * .9,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Patient Name: ${data.consultation!.fullName}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      // Text(
                                                      //   'Age: ${DateFormat.yMMMd().format(DateTime.parse(data.consultation!.age!))}',
                                                      //   style: TextStyle(
                                                      //     color: Colors.white,
                                                      //   ),
                                                      // ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Weight: ${data.consultation!.weight}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Main Reason: ${data.consultation!.mainReason}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Description: ${data.consultation!.descriptions}',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          if (data.isScheduled == 0 &&
                                              data.callAvailability ==
                                                  true) ...[
                                            // IconButton(
                                            //     onPressed: () {
                                            //       Get.to(CallEndPage(
                                            //         id: data.id.toString(),
                                            //         fullName: data
                                            //             .consultation!.fullName,
                                            //         weight: data
                                            //             .consultation!.weight.toString(),
                                            //         address: data.consultation!.fullAddress.toString(),
                                            //         age: data.consultation!.age.toString(),
                                            //         sex: "Male",
                                            //         reason: data.consultation!.mainReason!.toString(),
                                            //         aUserId: data.appointmentable!.id.toString(),
                                            //       ));
                                            //     },
                                            //     icon: Icon(Icons.add)),
                                            sendCallButton(
                                              // dataSetter: dataSetter(userData!, index),
                                                isVideoCall: true,
                                                inviteeUsersIDTextCtrl: controller
                                                    .singleInviteeUserIDTextCtrl,
                                                onCallFinished:
                                                onSendCallInvitationFinished,
                                                //onSendCallInvitationFinished,
                                                id: data.appointmentable!.id
                                                    .toString(),
                                                context: context),
                                          ] else ...[
                                            Container()
                                          ],
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                          dataSetter(controller.patientSchedule.value.data!, index);
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        );
      }
    });
  }

  Future<void> dataSetter(List<Datum> userData, int index) async {
    final pref = await SharedPreferences.getInstance();
    final data = userData[index];
    pref.setString('ap_id', data.id.toString());
    pref.setString('pst_name', data.consultation!.fullName!);
    pref.setString('weight', data.consultation!.weight!.toString());
    pref.setString('address', data.consultation!.fullAddress!);
    pref.setString('age', data.consultation!.age!);
    pref.setString('sex', "Male");
    pref.setString('reason', data.consultation!.mainReason!);
    pref.setString('aUser_id', data.appointmentable!.id.toString());
    print("ABir Save__${pref.getString('ap_id')}");
  }
  // Widget userListView() {
  //   late List<Widget> userInfo;
  //   late TextEditingController inviteeUsersIDTextCtrl;
  //
  //   inviteeUsersIDTextCtrl = singleInviteeUserIDTextCtrl;
  //
  //   userInfo = [
  //     Padding(
  //       padding: const EdgeInsets.all(18.0),
  //       child: const Text('invitee name'),
  //     ),
  //     inviteeIDFormField(
  //       textCtrl: inviteeUsersIDTextCtrl,
  //       formatters: [
  //         FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
  //       ],
  //       labelText: 'invitee ID',
  //       hintText: 'plz enter invitee ID',
  //     ),
  //   ];
  //
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           const SizedBox(width: 20),
  //           ...userInfo,
  //           Expanded(child: Container()),
  //           sendCallButton(
  //             isVideoCall: false,
  //             inviteeUsersIDTextCtrl: inviteeUsersIDTextCtrl,
  //             onCallFinished: onSendCallInvitationFinished,
  //           ),
  //           sendCallButton(
  //             isVideoCall: true,
  //             inviteeUsersIDTextCtrl: inviteeUsersIDTextCtrl,
  //             onCallFinished: onSendCallInvitationFinished,
  //           ),
  //           const SizedBox(width: 20),
  //         ],
  //       ),
  //       const Padding(
  //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
  //         child: Divider(height: 1.0, color: Colors.grey),
  //       ),
  //     ],
  //   );
  // }

  void onSendCallInvitationFinished(
    String code,
    String message,
    List<String> errorInvitees,
  ) {
    if (errorInvitees.isNotEmpty) {
      var userIDs = '';
      for (var index = 0; index < errorInvitees.length; index++) {
        if (index >= 5) {
          userIDs += '... ';
          break;
        }

        final userID = errorInvitees.elementAt(index);
        userIDs += '$userID ';
      }
      if (userIDs.isNotEmpty) {
        userIDs = userIDs.substring(0, userIDs.length - 1);
      }

      var message = "User doesn't exist or is offline: $userIDs";
      if (code.isNotEmpty) {
        message += ', code: $code, message:$message';
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (code.isNotEmpty) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

Widget inviteeIDFormField({
  required TextEditingController textCtrl,
  List<TextInputFormatter>? formatters,
  String hintText = '',
  String labelText = '',
}) {
  const textStyle = TextStyle(fontSize: 12.0);
  return Expanded(
    flex: 100,
    child: SizedBox(
      height: 30,
      child: TextFormField(
        style: textStyle,
        controller: textCtrl,
        inputFormatters: formatters,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: textStyle,
          labelText: labelText,
          labelStyle: textStyle,
          border: const OutlineInputBorder(),
        ),
      ),
    ),
  );
}

Widget sendCallButton({
  required bool isVideoCall,
  required String? id,
  required TextEditingController inviteeUsersIDTextCtrl,
  required BuildContext context,
  void Function(String code, String message, List<String>)? onCallFinished,
}) {
  return ValueListenableBuilder<TextEditingValue>(
    valueListenable: inviteeUsersIDTextCtrl,
    builder: (context, inviteeUserID, _) {
      final invitees = getInvitesFromTextCtrl(id.toString());
      print("Apoint IDDD __${id}");
      print("Call Finished __${onCallFinished}");
      return ZegoSendCallInvitationButton(
        isVideoCall: isVideoCall,
        invitees: invitees,
        resourceID: 'zego_data',
        iconSize: const Size(40, 40),
        buttonSize: const Size(50, 50),
        onPressed: onCallFinished,
      );
    },
  );
}

// void onSendCallInvitationFinished(
//     String code,
//     String message,
//     List<String> errorInvitees,
//     ) {
//   if(ZegoSignalingPluginCallUserState.cancelled==true){
//     print("Abir 1");
//
//   }else if(ZegoSignalingPluginCallUserState.accepted==true){
//     print("Abir 2");
//   }else if(ZegoSignalingPluginCallUserState.rejected==true){
//     print("Abir 3");
//   }else if(ZegoSignalingPluginCallUserState.received==true){
//     print("Abir 4");
//   }else if(ZegoSignalingPluginCallUserState.offline==true){
//     print("Abir 5");
//   }else{
//     print("Abir 6");
//   }
// }

List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
  final invitees = <ZegoUIKitUser>[];

  final inviteeIDs = textCtrlText.trim().replaceAll('，', '');
  inviteeIDs.split(',').forEach((inviteeUserID) {
    if (inviteeUserID.isEmpty) {
      return;
    }

    invitees.add(ZegoUIKitUser(
      id: inviteeUserID,
      name: 'user_$inviteeUserID',
    ));
  });

  return invitees;
}
