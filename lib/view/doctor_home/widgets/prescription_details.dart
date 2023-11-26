import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../doctor_send_prescription_user.dart';
import '../../../model/prescription_sent_to_dr.dart';

class PrescriptionDetailsScreen extends StatelessWidget {
   final String ? photo;
   final String ? description;
   final String ? name;
   final int id;

  const PrescriptionDetailsScreen({super.key, this.photo, this.description, this.name, required this.id});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Prescription Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prescription ID: ${id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Sent by: ${name}'),
            SizedBox(height: 16),
            Image.network("${photo}",height: 300,width: double.infinity,fit: BoxFit.cover,),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(description!),

            SizedBox(height: 20,),


            InkWell(
              onTap: (){

                Get.to(DoctorSendPrescriptionUser(
                  id: id.toString(),
                  fullName: name,
                  address: "",
                  weight: "",
                  age:"" ,
                  reason: "",
                  aUserId: ""



                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Text("Create Prescription",style: TextStyle(
                    fontSize: 16,color: Colors.white
                  ),),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
