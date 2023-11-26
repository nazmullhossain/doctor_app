import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/all_doctors.dart';
import 'allApointment/model.dart';
import 'controllers/app_controller.dart';
import 'controllers/user_controller.dart';
import 'package:http/http.dart' as http;

class ShortDoctorsListScreen222 extends StatefulWidget {
  final int? id;
  const ShortDoctorsListScreen222({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<ShortDoctorsListScreen222> createState() =>
      _ShortDoctorsListScreen222State();
}

class _ShortDoctorsListScreen222State extends State<ShortDoctorsListScreen222> {
  List<AppointmentHistoryModel> appintHistoryList = [];
  final AppController appController = Get.put(AppController());
  bool loader = false;
  Future<List<AppointmentHistoryModel>> getData() async {
    setState(() {
      loader = true;
    });
    String? token = await appController.token;
    var response = await http.get(
      Uri.parse("https://treatmenticwl.com/api/appointment-history"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      setState(() {
        appintHistoryList = appointmentHistoryModelFromJson(response.body);
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
    final userController = Get.find<UserController>();
    userController.fetchAllDoctors();
    userController.fetchRandomDoctors();
    userController.fetchAvailableDoctors();
    AppController appController = Get.find();
    print(appController.token!);
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Prescrtion Doctor"),
      ),
      body: loader ? Center(child: CircularProgressIndicator(),) : GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 5 / 6),
        itemCount: appintHistoryList.length,
        itemBuilder: (context, index) {
          var  doctorsData = appintHistoryList[index];
          print("${doctorsData.id}");
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 3,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 145,
                        child: Center(
                          child: doctorsData.doctor!.profilePhotoUrl!.isEmpty
                              ? Image.asset(
                                  "assets/images/stetho.png",
                                  height: 55,
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  foregroundImage: NetworkImage(
                                      doctorsData.doctor!.profilePhotoUrl!),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Center(
                  child: Text(
                    doctorsData.doctor!.name!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {
                      userController.sendPrescriptionToDoctor(
                     widget.id! , doctorsData.doctor!.id!, context,doctorsData.id!);
                      print("ID__${widget.id},${doctorsData.doctor!.id}");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Send"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
