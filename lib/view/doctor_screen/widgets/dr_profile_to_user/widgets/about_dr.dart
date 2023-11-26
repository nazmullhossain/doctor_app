import 'package:doctor_app/model/all_doctors.dart';
import 'package:flutter/material.dart';
import '../../../../../global_widgets/custom_card.dart';


class AboutDr extends StatelessWidget {
  final DoctorsData doctorsData;
  const AboutDr({Key? key, required this.doctorsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        column: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (doctorsData.appointment ==
                '1')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Available for Online Appointment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(doctorsData
                          .startDayForSchedule ??
                          ''),
                      Text(' -- '),
                      Text(doctorsData
                          .endDayForSchedule ??
                          '')
                    ],
                  ),
                  Row(
                    children: [
                      Text(doctorsData
                          .startTimeForSchedule ??
                          ''),
                      Text(' -- '),
                      Text(doctorsData
                          .endTimeForSchedule ??
                          '')
                    ],
                  )
                ],
              ),
            SizedBox(
              height: 6,
            ),
            if (doctorsData.instantCall ==
                '1')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instant Consultation',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(doctorsData
                          .startDayForInstant ??
                          ''),
                      Text(' -- '),
                      Text(doctorsData
                          .endDayForInstant ??
                          ''),
                    ],
                  ),
                  Row(
                    children: [
                      Text(doctorsData.startTimeForInstant ??
                          ''),
                      Text(' -- '),
                      Text(doctorsData .endTimeForInstant ??
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

        doctorsData.info != null?
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              Expanded(
                child: ListTile(
                  title: Text("Consultation fee"),
                  subtitle: Text("BDT ${doctorsData.info?.consultationFee}"),),
              ),
                Expanded(
                  child: ListTile(
                  title: Text("Follow-up fee"),
                  subtitle:  Text("BDT ${doctorsData.info!.followUpFee}"),
              ),
                ),
            ],):
            Container(height: 25,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("About ${doctorsData.name??''}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          doctorsData.about??'',

        ),
        SizedBox(height: 10,),
        Text(
          "BMDC ${doctorsData.bmdcNo}",
          style: TextStyle(
            fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold
          ),

        )
      ],
    ));
  }
}
