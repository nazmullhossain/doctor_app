import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMessages extends StatefulWidget {
  const SendMessages({Key? key}) : super(key: key);

  @override
  State<SendMessages> createState() => _SendMessagesState();
}

class _SendMessagesState extends State<SendMessages> {
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
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
          title: const Text(
            "Send Messages",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),

                child: Padding(
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
                      const Text("220 times")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              const Text("Description"),
              const SizedBox(height: 12,),
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
      ),
    );
  }
}
