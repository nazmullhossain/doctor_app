import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreatePaymentScreen extends StatefulWidget {
  const CreatePaymentScreen({Key? key}) : super(key: key);

  @override
  State<CreatePaymentScreen> createState() => _CreatePaymentScreenState();
}

class _CreatePaymentScreenState extends State<CreatePaymentScreen> {
  int? radio = 1;
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController bankName = TextEditingController();
  final TextEditingController branchName = TextEditingController();
  final TextEditingController bankCountry = TextEditingController();
  final TextEditingController accountHolderName = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController bicSwift = TextEditingController();
  final TextEditingController notes = TextEditingController();

  //Mobile
  final TextEditingController AccountType = TextEditingController();
  final TextEditingController provider = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Payment"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              value: 1,
              groupValue: radio,
              onChanged: (val) {
                setState(() {
                  radio = val;
                });
              },
              title: Text("Bank"),
            ),
            RadioListTile(
              value: 2,
              groupValue: radio,
              onChanged: (val) {
                setState(() {
                  radio = val;
                });
              },
              title: Text("Mobile Banking"),
            ),
            radio == 2
                ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: AccountType,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Account Type",
                        labelText: "Account Type"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: provider,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Provider",
                        labelText: "Provider"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: mobile,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Mobile Number ",
                        labelText: "Mobile Number "),
                  ),
                ),
              ],
            )
                : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: currencyController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Currency",
                        labelText: "Currency"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: bankName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Bank Name",
                        labelText: "Bank Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: branchName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Branch Name",
                        labelText: "Branch Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: bankCountry,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Bank Country ",
                        labelText: "Bank Country "),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: accountHolderName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Account Holder Name ",
                        labelText: "Account Holder Name "),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: accountNumber,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Account Number ",
                        labelText: "Account Number "),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: bicSwift,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Bic Swift ",
                        labelText: "Bic Swift "),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: notes,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Notes ",
                        labelText: "Notes "),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            loader
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ElevatedButton(
              onPressed: () {
                if (radio == 1) {
                  createBankAccount();
                } else {
                  createMobileAccount();
                }
              },
              child: Text("Create"),
              style: ElevatedButton.styleFrom(primary: Colors.indigo),
            )
          ],
        ),
      ),
    );
  }

  bool loader = false;

  createBankAccount() async {
    setState(() {
      loader = true;
    });

    AppController appController = Get.find();

    String? token= appController.token!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST',
        Uri.parse('https://www.treatmenticwl.com/api/payment-method/store'));
    request.fields.addAll({
      'payment_method': "1",
      'currency': '${currencyController.text}',
      'bank_name': '${bankName.text}',
      'branch_name': "${branchName.text}",
      'bank_country': '${bankCountry.text}',
      'account_holder_name': '${accountHolderName.text}',
      'account_number': '${accountNumber.text}',
      'bic_swift': '${bicSwift.text}',
      'notes': '${notes.text}',
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState(() {
        loader = false;
      });
      Fluttertoast.showToast(
          msg: "Successfully Created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    } else {
      setState(() {
        loader = false;
      });
    }
  }

  createMobileAccount() async {
    setState(() {
      loader = true;
    });
    AppController appController = Get.find();

    String? token = appController.token!;


    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST',
        Uri.parse('https://www.treatmenticwl.com/api/payment-method/store'));
    request.fields.addAll({
      'payment_method': "2",
      'account_type': '${AccountType.text}',
      'provider': '${provider.text}',
      'mobile_number': '${mobile.text}'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState(() {
        loader = false;
      });
      Fluttertoast.showToast(
          msg: "Successfully Created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    } else {
      setState(() {
        loader = false;
      });
    }
  }
}
