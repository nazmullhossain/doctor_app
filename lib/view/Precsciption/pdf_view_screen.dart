
import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ndialog/ndialog.dart';
import 'package:dio/dio.dart';

class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  late bool isLoading;
  bool _allowWriteFile = false;
  String progress = "";
  late Dio dio;

  @override
  void initState() {
    dio = Dio();
  }

  Future<String> getDirectoryPath() async {
    //  Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory? dir = await DownloadsPathProvider.downloadsDirectory;
    // // Directory directory= await new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true);

    return dir!.path;
  }

  requestWritePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        _allowWriteFile = true;
      });
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }

  Future downloadFile(String url, path) async {
    if (!_allowWriteFile) {
      requestWritePermission();
    }
    try {
      ProgressDialog progressDialog = ProgressDialog(context,
          dialogTransitionType: DialogTransitionType.Bubble,
          title: Text("Downloading File"),
          message: null);

      progressDialog.show();

      await dio.download(url, path, onReceiveProgress: (rec, total) {
        print(path);
        setState(() {
          isLoading = true;
          progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
          progressDialog.setMessage(Text("Dowloading $progress"));
        });
      });
      // viewPDF(path);
      progressDialog.dismiss();
      Get.snackbar("Success", "Download complete your file",backgroundColor: Colors.green,colorText: Colors.white);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.url;
    //  List<String> title=;
    String extension = url.split('/').last;
    print("PDF LONK____$extension");
    print("PDF LONK2____${widget.url}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('PDF'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.download,
                color: Colors.indigo,
              ),
              iconSize: 30,
              color: Colors.white,
              splashColor: Theme.of(context).primaryColor,
              onPressed: () async {
                Directory? appDocDirectory =
                    await getExternalStorageDirectory();

                Directory(appDocDirectory!.path + '/' + 'smart_note')
                    .create(recursive: true)

                    .then((Directory directory) {
                  print('Path of New Dir: ' + directory.path);
                  File f =
                      File(directory.path + '/' + 'treatment&cure' + "/$extension");
                  // downloadFile(url,directory.path+"/$extension");
                });
                getDirectoryPath().then((path) {
                  downloadFile(url, path + '/' + 'treatment&cure' + "/$extension");
                });
              },
            ),
          ),

        ],
      ),
      body:  PDF().cachedFromUrl(

        widget.url,
        placeholder: (double progress) => Center(
            child: Text(
          '$progress %',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        ),


        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
