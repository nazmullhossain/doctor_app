import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final Widget tab1, tab2;
  final String tab1Name, tab2Name;

  const CustomTabBar({
    Key? key,
    required this.tab1,
    required this.tab2,
    required this.tab1Name,
    required this.tab2Name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: tab1Name),
                    Tab(text: tab2Name),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [tab1, tab2],
            ),
          ),
        ],
      ),
    );
  }
}
