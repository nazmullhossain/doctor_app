import 'dart:io';
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:get/get.dart';
import '../../../controllers/user_controller.dart';

class ImgScanner extends StatefulWidget {
  @override
  _ImgScannerState createState() => _ImgScannerState();
}

class _ImgScannerState extends State<ImgScanner> {
  File? _scannedImage;
  String _description = '';
  AppController appController = Get.find();
  UserController userController = Get.find();

  openImageScanner(BuildContext context) async {
    var image = await DocumentScannerFlutter.launch(context,
        source: ScannerFileSource.GALLERY,
        labelsConfig: {

      ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next Step",
      ScannerLabelsConfig.ANDROID_OK_LABEL: "OK",

    });
    if (image != null) {
      setState(() {
        _scannedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyanAccent,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.navigate_before)),
        title: const Text('Document Scanner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (_scannedImage != null)
              Image.file(_scannedImage!, height: 500, width: 500),
            if (_scannedImage != null)
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    if (_scannedImage != null) {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Enter Description'),
                          content: TextField(
                            onChanged: (value) {
                              setState(() {
                                _description = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your description here',
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await userController.uploadPrescription(
                                  context,
                                  _scannedImage!.path,
                                  _description,
                                );
                                Navigator.pop(context);
                              },
                              child: Text('Upload'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please scan an image first!')),
                      );
                    }
                  },
                  child: Text("Upload Scanned Image"),
                ),
              ),
            if (_scannedImage == null)
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('No scanned image')),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  openImageScanner(context);
                },
                child: Text("Scan Image"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
