import 'package:doctor_app/view/Precsciption/pdf_view_screen.dart';
import 'package:doctor_app/view/Precsciption/prescription_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../controllers/app_controller.dart';

class MyPrescriptionScreen extends StatefulWidget {
  const MyPrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<MyPrescriptionScreen> createState() => _MyPrescriptionScreenState();
}

class _MyPrescriptionScreenState extends State<MyPrescriptionScreen> {
  MyPrescriptionModel? model;
  bool loader = false;
  final AppController appController = Get.find();

  Future<MyPrescriptionModel?> getData() async {
    String token = appController.token!;
    setState(() {
      loader = true;
    });
    var response = await http.get(
      Uri.parse(
          "https://www.treatmenticwl.com/api/user-agent/my-prescriptions"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      print("JJ${response.body}");
      setState(() {
        model = myPrescriptionModelFromJson(response.body);
        loader = false;
      });
    }
    return model;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Prescription"),
      ),
      body: loader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model!.data!.length,
              itemBuilder: (_, index) {
                var data = model!.data![index];
                print("KKK__${model!.data!.length}");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${data.pdfName}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(PdfViewerWidget(
                                url: '${data.pdf}',
                              ));
                            },
                            child: Text(
                              "Open Pdf",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
