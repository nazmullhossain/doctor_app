import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineAppointment extends StatefulWidget {
  const OnlineAppointment({Key? key}) : super(key: key);

  @override
  State<OnlineAppointment> createState() => _OnlineAppointmentState();
}

class _OnlineAppointmentState extends State<OnlineAppointment> {
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text(
            "Online Appointment",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              height: 25,
              width: 25,
              child: const Icon(
                Icons.navigate_before,
                color: Colors.black,
              ),
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text("Service Price",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("45\$/hour")
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/edit.png",
                          height: 25,
                          width: 25,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text("Consulted",style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("220 times"),
                  const SizedBox(height: 20,),
                const Divider(),
                  const Text("Working Days & Time",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8,),
                  const Text("Day"),
                  const SizedBox(height: 8,),
                  const Text("Saturday - Thursday"),
                  const SizedBox(height: 12,),
                  const Text("Time"),
                  const SizedBox(height: 8,),
                  const Text("7AM- 12PM"),
                  const Text("2PM- 6PM"),
                  const SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 12,),
                  const Text("Description"),
                  const SizedBox(height: 8,),
                  TextField(

                    maxLength: 200,
                    maxLines: 6,
                    controller: descController,
                    decoration: InputDecoration(


                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  )


                ],
              ),
            ),

        ],),),
      ),
    );
  }
}
