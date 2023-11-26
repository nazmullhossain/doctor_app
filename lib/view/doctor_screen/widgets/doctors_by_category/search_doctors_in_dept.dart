import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:get/get.dart';

import '../../../../controllers/user_controller.dart';
import '../../../../model/dr_by_dept.dart';
import '../../../consultation_details.dart';
import 'dr_profile.dart';

class SearchDoctorsInDept extends StatelessWidget {
  final List<DoctorByDept> doctorsData;

  const SearchDoctorsInDept({Key? key, required this.doctorsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();


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
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 340,
                ),
                itemCount: doctorsData.length,
                itemBuilder: (context, index) {
                  final doctor = doctorsData[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => DrProfile(drId:doctor.id!));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Card(
                                elevation: 3,
                                child: SizedBox(
                                  height: 150,
                                  width: 145,
                                  child: Center(
                                    child: doctor.profilePhotoUrl == null
                                        ? Image.asset(
                                      "assets/images/stetho.png",
                                      height: 55,
                                    )
                                        : CircleAvatar(
                                      radius: 70,
                                      foregroundImage: NetworkImage(
                                        doctor.profilePhotoUrl!,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12,
                                top: 12,
                                child: Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      doctor.status == true ? "Online" : "Offline",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              doctor.name!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 30,
                            child: OutlinedButton(
                              onPressed: ()async{
                                await userController.fetchAnyDrProfile(doctor.id!);
                                final data =  userController.anyDrProfile.value!.data!;

                                var result =  await flutterBkash.pay(
                                  context: context,
                                  amount: userController.anyDrProfile.value!.data!.info!.consultationFee!.toDouble(),
                                  merchantInvoiceNumber: "tranId",
                                );
                                if(result!=null){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ConsultationForm(
                                        doctorID: data.id.toString(),
                                        customerMsisdn:
                                        result.customerMsisdn,
                                        amount: data.info!.consultationFee.toString(),
                                        merchantInvoiceNumber:
                                        result.merchantInvoiceNumber,
                                        paymentID: result.paymentId,
                                        trxID: result.trxId,
                                      ),
                                    ),
                                  );
                                }
                              },
                              // onPressed: () async{
                              //  await userController.fetchAnyDrProfile(doctor.id!);
                              //
                              //   final data =  userController.anyDrProfile.value!.data!;
                              //
                              //   // print("FEE__${data.info!.consultationFee!.toDouble()}");
                              //
                              //   setState(() {
                              //     isLoading = true;
                              //   });
                              //   try {
                              //     print("FEE__${data.info!.consultationFee!.toDouble()}");
                              //     final result = await flutterBkash.pay(
                              //       context: context,
                              //       amount: userController.anyDrProfile.value!.data!.info!.consultationFee!.toDouble(),
                              //       merchantInvoiceNumber: "tranId",
                              //     );
                              //     if (result == null) {
                              //       setState(() {
                              //         isLoading = false;
                              //       });
                              //       _showSnackbar(
                              //           'Please wait while...', context);
                              //     } else {
                              //       setState(() {
                              //         isLoading = false;
                              //       });
                              //       print('You are ready for go');
                              //       log(result.toString());
                              //       _showSnackbar(
                              //           "(Success) tranId: ${result.trxId}",
                              //           context);
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (_) => ConsultationForm(
                              //             doctorID: data.id.toString(),
                              //             customerMsisdn:
                              //             result.customerMsisdn,
                              //             amount: data.info!.consultationFee.toString(),
                              //             merchantInvoiceNumber:
                              //             result.merchantInvoiceNumber,
                              //             paymentID: result.paymentId,
                              //             trxID: result.trxId,
                              //           ),
                              //         ),
                              //       );
                              //     }
                              //   } on BkashFailure catch (e, st) {
                              //     setState(() {
                              //       isLoading = false;
                              //     });
                              //     log(e.message,
                              //         error: e, stackTrace: st);
                              //     _showSnackbar(e.message, context);
                              //   } catch (e, st) {
                              //     setState(() {
                              //       isLoading = false;
                              //     });
                              //     log("Something went wrong",
                              //         error: e, stackTrace: st);
                              //     _showSnackbar(
                              //         "Something went wrong", context);
                              //   }
                              // },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(Icons.video_call),
                                  Text("See doctor now"),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 30,
                          //   child: OutlinedButton(
                          //     onPressed: () {
                          //       Get.to(() => ConsultationForm());
                          //     },
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: const [
                          //         Icon(Icons.video_call),
                          //         Text("ডাক্তার দেখান"),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
