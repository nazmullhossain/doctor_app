import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import '../../../controllers/app_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../consultation_details.dart';
import 'bold_text.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

class DoctorOverview extends StatefulWidget {
  final String doctorFee;
  final String doctorName;
  final String doctorID;

  const DoctorOverview({
    Key? key,
    required this.doctorFee,
    required this.doctorName,
    required this.doctorID,
  }) : super(key: key);

  @override
  State<DoctorOverview> createState() => _DoctorOverviewState();
}

class _DoctorOverviewState extends State<DoctorOverview> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  final UserController userController = Get.find();
  Future<void> fetchData() async {

    await userController.fetchUserProfile();
  }

  bool isLoading = false;

  final AppController appController = Get.find();

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
    print(widget.doctorFee);
    print("___DHHHH${widget.doctorID}");
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const BoldText(text: "Overview"),
      ),
      body: Stack(
        children: [
          isLoading ? const Center(
            child: CircularProgressIndicator(),
          ) : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey,
                          ),
                          child: Image.asset("assets/images/stetho.png")),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              text: widget.doctorName,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(child: Text("We wii assign a doctor\nfor you ")),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Patient info"),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        foregroundImage: AssetImage("assets/images/profile.png"),
                      ),
                       Text("${userController.userProfile.value!.data!.phone??""}"),
                      Container(
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text("myself"),
                        ),
                      ),
                      SizedBox(
                          height: 25,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Tap for other"))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "You can submit your medical\nhistory in the next page",
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const BoldText(text: "Payment Details"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Consultation fee"),
                      Text(widget.doctorFee.toString()),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: const [
                  //    // Text("Vat(5%)"),
                  //     Text("৳21.00"),
                  //   ],
                  // ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      BoldText(text: "Net Amount"),
                      BoldText(text: "৳${widget.doctorFee}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.local_offer),
                      const Text("Do you have coupon code"),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.navigate_next)),
                    ],
                  ),
                  const BoldText(text: "Payment Method")
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        height: size.height * .120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pay With',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {

                    final result = await flutterBkash.pay(
                      context: context,
                      amount: double.parse(widget.doctorFee),
                      merchantInvoiceNumber: "tranId",
                    );
                    if(result == null){
                      setState(() {
                        isLoading = false;
                      });
                      _showSnackbar('Please wait while...');
                    } else{
                      setState(() {
                        isLoading = false;
                      });
                      print('You are ready for go');
                      dev.log(result.toString());
                      _showSnackbar("(Success) tranId: ${result.trxId}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ConsultationForm(

                            doctorID: widget.doctorID,
                            customerMsisdn: result.customerMsisdn,
                            amount: widget.doctorFee,
                            merchantInvoiceNumber: result.merchantInvoiceNumber,
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
                    dev.log(e.message, error: e, stackTrace: st);
                    _showSnackbar(e.message);
                  } catch (e, st) {
                    setState(() {
                      isLoading = false;
                    });
                    dev.log("Something went wrong", error: e, stackTrace: st);
                    _showSnackbar("Something went wrong");
                  }
                },
                child: Container(
                  height: 50,
                  width: size.width * .4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bkash_logo.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String message) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
