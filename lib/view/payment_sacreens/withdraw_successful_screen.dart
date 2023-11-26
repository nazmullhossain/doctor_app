import 'package:doctor_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawalHistoryScreen extends StatefulWidget {
  const WithdrawalHistoryScreen({Key? key}) : super(key: key);

  @override
  WithdrawalHistoryScreenState createState() => WithdrawalHistoryScreenState();
}

class WithdrawalHistoryScreenState extends State<WithdrawalHistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Success"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset(
            "assets/images/download.png",
            height: 200,
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "Withdraw Successfully",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            Get.offAll(SplashScreen());
          }, child: Text("Back to Home"))
        ],
      ),
      // appBar: AppBar(
      //   title: const Text('Withdrawal History'),
      //   bottom: TabBar(
      //     controller: _tabController,
      //     tabs: [
      //       Container(
      //         color: Colors.blue, // Set your desired color here
      //         child: Tab(text: 'Request'),
      //       ),
      //       Container(
      //         color: Colors.green, // Set your desired color here
      //         child: Tab(text: 'Pending'),
      //       ),
      //       Container(
      //         color: Colors.orange, // Set your desired color here
      //         child: Tab(text: 'Success'),
      //       ),
      //     ],
      //   ),
      // ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: const [
      //     WithdrawalTab(status: 'Request'),
      //     WithdrawalTab(status: 'Pending'),
      //     WithdrawalTab(status: 'Success'),
      //   ],
      // ),
    );
  }
}

class WithdrawalTab extends StatelessWidget {
  final String status;

  const WithdrawalTab({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Withdrawals with status: $status'),
    );
  }
}
