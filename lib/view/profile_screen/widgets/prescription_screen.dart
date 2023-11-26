import 'package:doctor_app/view/profile_screen/widgets/prescription_details.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../all_doctor_screen.dart';
import '../../../controllers/app_controller.dart';
import '../../../controllers/user_controller.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  final UserController userController = Get.find();
  final AppController appController = Get.find();
  final addDescriptionsCtrl = TextEditingController();
  final GlobalKey<FormState> _updateDescKey = GlobalKey<FormState>();
  String? updateDesc;

  @override
  void initState() {
    super.initState();
    userController.fetchUserAgentUploadedPrescriptions();
  }

  Future<void> fetchData() async {
    await userController.uploadedPrescriptionsList();
  }

  Future<void> addPrescription(String descriptions) async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (pickedFile != null && pickedFile.files.isNotEmpty) {
      String photoPath = pickedFile.files.single.path!;

      try {
        await userController
            .uploadPrescription(context, photoPath, descriptions)
            .then((value) => userController.uploadedPrescriptionsList());
      } catch (e) {}
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No photo picked')));
    }
  }

  Future<void> updatePrescription(int id, String descriptions) async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    String photoPath;
    if (pickedFile != null && pickedFile.files.isNotEmpty) {
      photoPath = pickedFile.files.single.path!;
    } else {
      photoPath = userController.uploadedPrescriptionsList
          .firstWhere((p) => p.id == id)
          .photo!;
    }

    await userController
        .updatePrescription(
          context,
          id,
          photoPath,
          descriptions,
        )
        .then((value) => userController.uploadedPrescriptionsList());
  }

  Future<void> deletePrescription(int prescriptionId) async {
    await userController
        .deletePrescription(context, prescriptionId)
        .then((value) => userController.uploadedPrescriptionsList());
  }



  Widget build(BuildContext context) {
    userController.fetchUserAgentUploadedPrescriptions();
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Mobile Records'),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Add'),
                  content: TextFormField(
                    controller: addDescriptionsCtrl,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  actions: <Widget>[
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addPrescription(
                          addDescriptionsCtrl.text,
                        ).then((value) {

                            userController.fetchUserAgentUploadedPrescriptions();
                            Navigator.pop(context);

                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'Add Records',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(Icons.add_circle_outline),
              ],
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: userController.uploadedPrescriptionsList.length,
                  itemBuilder: (context, index) {
                    final prescription =
                        userController.uploadedPrescriptionsList[index];
          print("${prescription.photo!}");

                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => ShortDoctorsListScreen222(
                            id: prescription.id!,

                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              trailing:  Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  appController.usertype =="agent" ? Container() :   IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title:
                                              const Text(' Update'),
                                          content: Form(
                                            key: _updateDescKey,
                                            child: TextFormField(
                                              onSaved: (String? newText) {
                                                updateDesc = newText ??
                                                    prescription.descriptions;
                                              },
                                              initialValue:
                                                  prescription.descriptions,
                                              decoration: InputDecoration(
                                                labelText: 'New Description',
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            OutlinedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                _updateDescKey.currentState!
                                                    .save();
                                                updatePrescription(
                                                  prescription.id!,
                                                  updateDesc!,
                                                ).then((value) {
                                                  setState(() {
                                                    userController.fetchUserAgentUploadedPrescriptions();
                                                    Navigator.pop(context);
                                                  });
                                                });

                                              },
                                              child: const Text('Update'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Image.asset(
                                      'assets/images/edit.png',
                                      height: 16,
                                      width: 16,
                                    ),
                                  ),
                                  appController.usertype =="agent" ? Container() :  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(
                                              'Deletion'),
                                          content: const Text(
                                              'Want to delete records?'),
                                          actions: <Widget>[
                                            OutlinedButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                deletePrescription(
                                                    prescription.id!);
                                                Navigator.pop(
                                                    context, 'Delete');
                                              },
                                              child: const Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.delete_sweep),
                                  ),
                                ],
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(prescription.photo!),
                              ),
                              title: Text(
                                prescription.descriptions!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
