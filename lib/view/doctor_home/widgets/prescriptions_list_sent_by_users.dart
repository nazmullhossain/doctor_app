import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/app_controller.dart';
import '../../../controllers/dr_controller.dart';
import '../../../model/prescription_sent_to_dr.dart';
import 'package:http/http.dart'as http;
import '../../../model/test_doctor_report_model.dart';
import 'prescription_details.dart';

class PrescriptionsSentByUserScreen extends StatefulWidget {
  @override
  State<PrescriptionsSentByUserScreen> createState() =>
      _PrescriptionsSentByUserScreenState();
}

class _PrescriptionsSentByUserScreenState
    extends State<PrescriptionsSentByUserScreen> {
  final DrController drController = Get.find();

  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _loadData() async {
    await drController.fetchPrescriptionsFromUsers();
  }

  void _filterPrescriptions(String query) {
    drController.filterPrescriptions(query);
  }

  TestDoctorReportModel ? appintHistoryList;
  final AppController appController = Get.put(AppController());
  bool loader = false;
  Future<TestDoctorReportModel?> getData() async {
    setState(() {
      loader = true;
    });
    String? token = await appController.token;
    var response = await http.get(
      Uri.parse("https://treatmenticwl.com/api/doctor/test-report-for-doctor"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      setState(() {
        appintHistoryList = testDoctorReportModelFromJson(response.body);
        loader = false;
      });
    } else {
      setState(() {
        print("YYY${response.body}");
        loader = false;
      });
    }
    return appintHistoryList;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    drController.fetchPrescriptionsFromUsers();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Prescriptions Sent by Users'),
      ),
      body:  loader ? Center(child: CircularProgressIndicator(),) :  ListView.builder(
        itemCount: appintHistoryList!.data!.length,
        itemBuilder: (context, index) {
          final prescription =
          appintHistoryList!.data![index];
          return   Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "${prescription.photo}"),
                ),
                title: Text(prescription.descriptions!),
                subtitle: Text(
                    'Sent by: ${prescription.userAgent?.name ?? 'Unknown User'}'),
                onTap: () {
                  Get.to(() => PrescriptionDetailsScreen(
                    photo: prescription.photo,
                    name: prescription.userAgent!.name,
                    description: prescription.descriptions,
                    id: prescription.pivot!.appointmentId!,
                  ));
                },
              ),
            ),
          );
        },
      ),
      // Column(
      //   children: [
      //
      //     Expanded(
      //       child: Obx(() {
      //         if (drController.isPrescriptionFromUserLoading.value) {
      //           return Center(child: CircularProgressIndicator());
      //         } else if (drController.filteredPrescriptions.isNotEmpty) {
      //           return
      //             ListView.builder(
      //             itemCount: drController.filteredPrescriptions.length,
      //             itemBuilder: (context, index) {
      //               final prescription =
      //                   drController.filteredPrescriptions[index];
      //               return buildPrescriptionCard(prescription);
      //             },
      //           );
      //         } else if (drController.prescriptionsListFromUser.isNotEmpty) {
      //           final prescriptions = drController.prescriptionsListFromUser;
      //           return ListView.builder(
      //             itemCount: prescriptions.length,
      //             itemBuilder: (context, index) {
      //               final prescription = prescriptions[index];
      //               return buildPrescriptionCard(prescription);
      //             },
      //           );
      //         } else {
      //           return Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text('No prescriptions sent by users found'),
      //                 ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(12),
      //                     ),
      //                   ),
      //                   onPressed: () => _loadData(),
      //                   child: Text('Reload'),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }
      //       }),
      //     ),
      //   ],
      // ),
    );
  }

  // Widget buildPrescriptionCard(PrescriptionsData prescription) {
  //   print("aaa__${prescription.photo}");
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     child: Card(
  //       elevation: 4,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       child: ListTile(
  //         leading: CircleAvatar(
  //           backgroundImage: NetworkImage(
  //               "${prescription.photo}"),
  //         ),
  //         title: Text(prescription.descriptions!),
  //         subtitle: Text(
  //             'Sent by: ${prescription.userAgent?.name ?? 'Unknown User'}'),
  //         onTap: () {
  //           Get.to(() => PrescriptionDetailsScreen(prescription: prescription));
  //         },
  //       ),
  //     ),
  //   );
  // }
}
