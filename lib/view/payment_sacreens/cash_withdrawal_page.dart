import 'package:flutter/material.dart';

class CashWithdrawalPage extends StatefulWidget {
  const CashWithdrawalPage({super.key});

  @override
  State<CashWithdrawalPage> createState() => _CashWithdrawalPageState();
}

class _CashWithdrawalPageState extends State<CashWithdrawalPage> {
  final accountNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw Money'),
        actions: [TextButton(onPressed: (){}, child: const Text("History",))],
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: [
                const Text('Amount'),
                const Text(
                  '\$0.00',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  '\$500',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),
                const Text(
                  'Available Balance',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),


                const SizedBox(height: 80.0),
                const Text("Withdraw Money to",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                const SizedBox(height: 8,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.account_balance),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          controller: accountNumberController,
                          decoration: const InputDecoration(
                            label: Text("Account Name"),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Icon(Icons.check_box),
                    ],
                  ),
                ),

                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text('Confirm Withdraw'),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
