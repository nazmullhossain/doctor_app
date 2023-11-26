import 'package:doctor_app/view/payment_sacreens/withdraw_history/widgets/widget_history_tabbar.dart';
import 'package:flutter/material.dart';

class WithdrawHistory extends StatelessWidget {
  const WithdrawHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw History'),
      ),
      body: const WithdrawHistoryTabBar(
        tab1: Center(
          child: Text("Request"),
        ),
        tab3: Center(
          child: Text("Success"),
        ),
        tab2: Center(
          child: Text("Pending"),
        ),
        tab1Name: 'Request',
        tab2Name: 'Pending',
        tab3Name: 'Success',
      ),
    );
  }
}
