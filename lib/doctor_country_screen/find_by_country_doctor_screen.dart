import 'dart:developer';

import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/controllers/user_controller.dart';
import 'package:doctor_app/doctor_country_screen/doctor_country_model.dart';
import 'package:doctor_app/model/all_doctors.dart';
import 'package:doctor_app/model/dr_by_dept.dart';
import 'package:doctor_app/view/doctor_screen/widgets/doctors_by_category/search_doctors_in_dept.dart';
import 'package:doctor_app/view/doctor_screen/widgets/search_doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../view/consultation_details.dart';
import '../view/doctor_screen/widgets/doctors_by_category/dr_profile.dart';
class DoctorCountryScreen extends StatefulWidget {
  final int ?  countryId;
  final String ? countryName;

  DoctorCountryScreen({Key? key, required this.countryId, this.countryName, }) : super(key: key);

  @override
  State<DoctorCountryScreen> createState() => _DoctorCountryScreenState();
}

class _DoctorCountryScreenState extends State<DoctorCountryScreen> {

     bool loader = false;
     DoctorCountryModel ? countryModel;
     Future<DoctorCountryModel?> getDoctorByCOuntry()async{
       setState(() {
         loader = true;
       });
       AppController appController = Get.find();
       String ? token = appController.token;

       var response = await  http.get(Uri.parse("https://treatmenticwl.com/api/doctors-by-country/${widget.countryId}"),
         headers: {
         "Authorization" : "Bearer $token"
         },
       );
       if(response.statusCode==200){
         setState(() {
           countryModel = doctorCountryModelFromJson(response.body);
           loader = false;
         });

       }else{
         setState(() {
           loader = false;
         });
       }
       return countryModel;

     }

     @override
  void initState() {
    // TODO: implement initState
    super.initState();

   setState(() {
     getDoctorByCOuntry();
   });
  }



  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    // userController.fetchDoctorsByDept(widget.deptId);
    // print("JJ__${widget.deptId}");
    // Future <void> reload()async{
    //   await  userController.fetchDoctorsByDept(widget.deptId);
    // }

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
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("${widget.countryName}")
      ),
      body: loader ? Center(child: CircularProgressIndicator(),) : Padding(
          padding: const EdgeInsets.all(8.0),
          child:
       countryModel!.data!.doctors!.isEmpty ? Center(
         child: Text("No doctor found",style: TextStyle(fontSize: 18,color: Colors.black),),
       )  :  GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 340,
            ),
            itemCount:countryModel!.data!.doctors!.length,
            itemBuilder: (context, index) {
              final doctor = countryModel!.data!.doctors![index];

              return InkWell(
                onTap: () {
                  Get.to(() =>
                      DrProfile(drId: doctor.id!));
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
                                child: doctor.profilePhotoUrl!
                                    .isEmpty
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
                                borderRadius:
                                BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  doctor.status == true
                                      ? "Online"
                                      : "Offline",
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
                      // doctor.experience!.isEmpty ? Container() :   Container(
                      //   height: 30,
                      //   width: 150,
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     primary: false,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: doctor.experience!.length,
                      //     itemBuilder: (_,index){
                      //       var data = doctorsData.experience![index];
                      //       return Container(
                      //         alignment: Alignment.topLeft,
                      //         child: Text("${data.designation} ,",style: TextStyle(
                      //             fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600
                      //         ),),
                      //       );
                      //     },
                      //   ),
                      // ),
                      //
                      //
                      // doctorsData.departments!.isEmpty ? Container() :   ListView.builder(
                      //   shrinkWrap: true,
                      //   primary: false,
                      //   itemCount: doctorsData.departments!.length,
                      //   itemBuilder: (_,index){
                      //     var data = doctorsData.departments![index];
                      //     return Container(
                      //       width: 200,
                      //       child: Text("${data.name} ,",style: TextStyle(
                      //           fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400
                      //       ),),
                      //     );
                      //   },
                      // ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text(
                            "(200)",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            doctor.avgRatingStars == null
                                ? "Avg rating?"
                                : doctor.avgRatingStars.toString(),
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
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
                                    schedule: "1",

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
                    ],
                  ),
                ),
              );
            },
          ),
          )
    );
  }
}
void _showSnackbar(String message, context) => ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(SnackBar(content: Text(message)));