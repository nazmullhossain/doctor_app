import 'package:doctor_app/view/consultation_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:get/get.dart';
import '../../../controllers/user_controller.dart';
import '../../../model/all_doctors.dart';
import 'dr_profile_to_user/dr_profile_to_user.dart';

class ShortDoctorsListScreen extends StatefulWidget {
  final List<DoctorsData> doctors;
  const ShortDoctorsListScreen({Key? key, required this.doctors}) : super(key: key);

  @override
  State<ShortDoctorsListScreen> createState() => _ShortDoctorsListScreenState();
}

class _ShortDoctorsListScreenState extends State<ShortDoctorsListScreen> {
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
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      cacheExtent: 2,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 400),
      itemCount: widget.doctors.length,
      itemBuilder: (context, index) {
        DoctorsData doctorsData = widget.doctors[index];

        return InkWell(
          onTap: () {
            Get.to(() => DrProfileToUser(doctorsData: doctorsData));
          },
          child: Padding(
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
                          child: doctorsData.profilePhotoUrl!.isEmpty ? Image.asset(
                                  "assets/images/stetho.png",
                                  height: 55,
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  foregroundImage:
                                      NetworkImage(doctorsData.profilePhotoUrl!),
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
                              doctorsData.status! ? "Online" : "Offline",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4,),

                Center(
                  child: Text(
                    doctorsData.name!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: 4,),

                doctorsData.experience!.isEmpty ? Container() :   Container(
                  height: 30,
                  width: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: doctorsData.experience!.length,
                    itemBuilder: (_,index){
                      var data = doctorsData.experience![index];
                      return Container(
                        alignment: Alignment.topLeft,
                        child: Text("${data.designation}",style: TextStyle(
                            fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600
                        ),),
                      );
                    },
                  ),
                ),


                doctorsData.departments!.isEmpty ? Container() :   ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: doctorsData.departments!.length,
              itemBuilder: (_,index){
                var data = doctorsData.departments![index];
                return Container(
                 width: 200,
                  child: Text("${data.name}",style: TextStyle(
                    fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400
                  ),),
                );
              },
            ),
                SizedBox(height: 0,),

                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      "(2)",
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      doctorsData.avgRatingStars?.toString() ?? "Avg rating ",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  doctorsData.info?.consultationFee != null
                      ? "Consultation fees: ${doctorsData.info!.consultationFee}"
                      : "Consultation fee: 0",
                ),
                Text(
                  doctorsData.info?.followUpFee != null
                      ? "Follow-up fees: ${doctorsData.info!.followUpFee}"
                      : "Follow-up fee: 0",
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () async{
                      await userController.fetchAnyDrProfile(doctorsData.id!);
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
                      //Get.to(() => ConsultationForm());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.video_call),
                        Text("ডাক্তার দেখান"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
