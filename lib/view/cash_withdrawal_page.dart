import 'package:doctor_app/controllers/app_controller.dart';
import 'package:doctor_app/view/payment_sacreens/payment_crud/create_payment_screen.dart';
import 'package:doctor_app/view/payment_sacreens/withdraw_successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../model/payment_list_model.dart';
class CashWithdrawalPage extends StatefulWidget {
  @override
  State<CashWithdrawalPage> createState() => _CashWithdrawalPageState();
}

class _CashWithdrawalPageState extends State<CashWithdrawalPage> {
  final AppController appController = Get.find();
  PaymentListModel? paymentListModel;
  bool loader = false;
  int ? radiovalue;
  int ? selectedvalue;


  delete(int id)async{
    String token = appController.token!;
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://www.treatmenticwl.com/api/payment-method/delete'));
    request.fields.addAll({
      'payment_method_id': '$id'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Successfully Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {

      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future<PaymentListModel?> getPaymentList() async {

    setState(() {
      loader = true;
    });

    AppController appController = Get.find();
    String? token= appController.token!;
    var headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(
      Uri.parse("https://www.treatmenticwl.com/api/payment-method/payout"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      setState(() {
        loader = false;
        paymentListModel = paymentListModelFromJson(response.body);
      });
    }

    return paymentListModel;
  }

  final TextEditingController cashAmountController = TextEditingController();
//int radio = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPaymentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        leading:   IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey),
                height: 25,
                width: 25,
                child: const Icon(
                  Icons.navigate_before,
                  color: Colors.black,
                ))),
        title: Text('Withdrawal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // RadioListTile(
            //   value: 1,
            //   groupValue: radio,
            //   onChanged: (val) {
            //     setState(() {
            //       radio = val!;
            //     });
            //   },
            //   title: Text("Bank"),
            // ),
            // RadioListTile(
            //   value: 2,
            //   groupValue: radio,
            //   onChanged: (val) {
            //     setState(() {
            //       radio = val!;
            //     });
            //   },
            //   title: Text("Mobile Banking"),
            // ),


            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
              child: TextFormField(
                controller: cashAmountController,
                decoration: InputDecoration(
                  labelText: 'Withdraw Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(selectedvalue==null){
                      Fluttertoast.showToast(
                          msg: "Please Select your payment method",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else if(cashAmountController.text.isEmpty){
                      Fluttertoast.showToast(
                          msg: "Please input your amount",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }else{
                      cashWidthreaw();
                    }


                  },
                  child: Text('Withdraw'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Payment",style: TextStyle(
                      fontSize: 20,color: Colors.black
                  ),),
                  ElevatedButton(onPressed: (){
                    Get.to(CreatePaymentScreen(),);
                  }, child:  Text("Add Payment"),)
                ],
              ),
            ),
            loader ? Center(
              child: CircularProgressIndicator(),
            ) : ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: paymentListModel!.data!.length,
              itemBuilder: (_, index) {
                var data = paymentListModel!.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        data.paymentMethod!= "mobile-banking"  ?
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Currency : ${data.currency}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Bank Name : ${data.bankName}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Bank Name : ${data.bankName}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Branch Name :${data.branchName}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Bank Country :${data.bankCountry}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Name :${data.accountHolderName}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Number :${data.accountNumber}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Bic : ${data.bicSwift}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text("Note : ${data.notes}",style: TextStyle(
                                  fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                              ),),
                            ),

                          ],
                        ) :
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Type : Mobile Banking",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Account Type : ${data.mobileBankingAccountType}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Provider : ${data.mobileBankingProviderName}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Mobile : ${data.mobileBankingMobileNumber}",style: TextStyle(
                                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500
                                    ),),
                                  ),

                                ],
                              ),

                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Radio(
                              value: index,
                              groupValue: radiovalue,
                              onChanged: (val){
                                setState(() {
                                  radiovalue = val;
                                  selectedvalue = data.id;
                                  print("RADIO Val--$selectedvalue");
                                });
                              },

                            ),

                            IconButton(onPressed: (){

                              setState(() {
                                delete(data.id!);
                                paymentListModel!.data!.removeAt(index);
                              });
                            }, icon: Icon(Icons.delete,color: Colors.red,)),
                          ],
                        )

                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  cashWidthreaw()async{
    final AppController appController = Get.find();
    String token = appController.token!;
    var headers = {
      'Authorization': 'Bearer $token'
    };

    var response = await http.post(Uri.parse("https://www.treatmenticwl.com/api/withdraw"),
      headers: headers,
      body: {
        "amount" : "${cashAmountController.text}",
        "payment_method_id" : "$selectedvalue",
      },
    );
    if(response.statusCode==200){
      print("Okk");
      Fluttertoast.showToast(
          msg: "Withdraw Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Get.offAll(WithdrawalHistoryScreen());
    }else {
      if(response.statusCode==400){
        Fluttertoast.showToast(
            msg: "The selected payment method id is invalid.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
    }

  }
}
