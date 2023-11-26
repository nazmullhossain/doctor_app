import 'package:doctor_app/model/transaction_history_model.dart';
import 'package:doctor_app/model/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../controllers/app_controller.dart';
import '../cash_withdrawal_page.dart';



class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  final AppController appController = Get.find();
  WalletModel? walletModel;
  TransactionHistoryModel? transactionHistoryModel;
  bool loader = false;
  bool loader2 = false;
  Future<WalletModel?> getWalletdata() async {
    String token = appController.token!;
    setState(() {
      loader2 = true;
    });
    var response = await http.get(
      Uri.parse("https://www.treatmenticwl.com/api/wallet"),
      headers: {
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      loader2 = false;
      walletModel = walletModelFromJson(response.body);
      setState(() {});
    }
    return walletModel;
  }

  Future<TransactionHistoryModel?> getTransData() async {

    String token = appController.token!;
    setState(() {
      loader = true;
    });

    var response = await http.get(
      Uri.parse("https://www.treatmenticwl.com/api/withdraw/history"),
      headers: {
        "Authorization": "Bearer $token "
      },
    );
    if (response.statusCode == 200) {
      loader = false;
      transactionHistoryModel = transactionHistoryModelFromJson(response.body);
      setState(() {});
    }
    return transactionHistoryModel;
  }

  @override
  void initState() {
    super.initState();
    getWalletdata();
    getTransData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:    Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Container(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.to(CashWithdrawalPage());
            },
            child: const Text('Withdraw'),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Balance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //const SizedBox(height: 8.0),
              const Icon(
                Icons.account_balance_wallet_rounded,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 20,
              ),
              loader2
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Text(
                '${walletModel!.amount}',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Available Balance',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Transaction History',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                      ))
                ],
              ),
              loader ? Center(
                child: CircularProgressIndicator(),
              )  : SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: transactionHistoryModel!.data!.length,
                    itemBuilder: (_, index) {
                      var data = transactionHistoryModel!.data![index];
                      return Container(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${data.paymentMethodId!=2 ? "Mobile Banking" : "Bank"}",style: TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.bold
                                  ),),
                                ),
                                data.paymentMethodId==2  ?
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Payment Method : ${data.paymentMethods!.paymentMethod}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Currency : ${data.paymentMethods!.currency}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Bank Name : ${data.paymentMethods!.bankName}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Branch Name : ${data.paymentMethods!.branchName}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Account Name : ${data.paymentMethods!.accountHolderName}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Account Number : ${data.paymentMethods!.accountNumber}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Bic Swift : ${data.paymentMethods!.bicSwift}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text("Notes : ${data.paymentMethods!.notes}"),
                                    ),
                                  ],
                                ) :
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text("Payment Method : ${data.paymentMethods!.paymentMethod}"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text("Provider : ${data.paymentMethods!.mobileBankingProviderName}"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text("Account Type : ${data.paymentMethods!.mobileBankingAccountType}"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text("Mobile : ${data.paymentMethods!.mobileBankingMobileNumber}"),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
