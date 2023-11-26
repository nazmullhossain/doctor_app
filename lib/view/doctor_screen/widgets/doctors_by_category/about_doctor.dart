import 'package:doctor_app/model/all_doctors.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/model/dr_by_dept.dart';
import 'package:flutter/material.dart';
import '../../../../../global_widgets/custom_card.dart';


class AboutDoctor extends StatelessWidget {
  final DoctorModel doctorsData;
  const AboutDoctor({Key? key, required this.doctorsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        column: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Available for Online Appointment',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                      SizedBox(height: 4,),
                      Row(
                        children: [
                          Text(doctorsData.data!
                              .startDayForSchedule ??
                              ''),
                          Text(' -- '),
                          Text(doctorsData.data!
                              .endDayForSchedule ??
                              '')
                        ],
                      ),
                      Row(
                        children: [
                          Text(doctorsData.data!
                              .startTimeForSchedule ??
                              ''),
                          Text(' -- '),
                          Text(doctorsData.data!
                              .endTimeForSchedule ??
                              '')
                        ],
                      )
                    ],
                  ),
                SizedBox(
                  height: 6,
                ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instant Consultation',
                        style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4,),
                      Row(
                        children: [
                          Text(doctorsData.data!
                              .startDayForInstant ??
                              ''),
                          Text(' -- '),
                          Text(doctorsData.data!
                              .endDayForInstant ??
                              ''),
                        ],
                      ),
                      Row(
                        children: [
                          Text(doctorsData.data!.startTimeForInstant ??
                              ''),
                          Text(' -- '),
                          Text(doctorsData.data! .endTimeForInstant ??
                              ''),
                        ],
                      )
                    ],
                  ),
              ],
            ),
            SizedBox(height: 8,),
            const Text(
              "Fees",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            doctorsData.data!.info != null?
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Consultation fee",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("৳ ${doctorsData.data!.info?.consultationFee}")
                    ],
                ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Follow-up fee",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("৳ ${doctorsData.data!.info!.followUpFee}"),
                    ],
                  ),
                ),

              ],):
            Container(),
            SizedBox(height: 12,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("About ${doctorsData.data!.name??''}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              doctorsData.data!.about??'',
              // maxLines: 3,
              // overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "BMDC No. : ${doctorsData.data!.bmdcNo}",
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),

            Text("Exprience"),
            doctorsData.data!.experience!.isEmpty ? Container() :   Container(
              height: 30,
              width: 150,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: doctorsData.data!.experience!.length,
                itemBuilder: (_,index){
                  var data = doctorsData.data!.experience![index];
                  return Container(
                    alignment: Alignment.topLeft,
                    child: Text("${data.designation} ,",style: TextStyle(
                        fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600
                    ),),
                  );
                },
              ),
            ),

            Text("Department"),
            SizedBox(height: 4,),
            doctorsData.data!.departments!.isEmpty ? Container() :   ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: doctorsData.data!.departments!.length,
              itemBuilder: (_,index){
                var data = doctorsData.data!.departments![index];
                return Container(
                  width: 200,
                  child: Text("${data.name} ,",style: TextStyle(
                      fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600
                  ),),
                );
              },
            ),
          ],
        ));
  }
}
