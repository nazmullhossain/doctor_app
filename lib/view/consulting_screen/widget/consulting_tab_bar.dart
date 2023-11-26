import 'package:flutter/material.dart';

import 'consults_today/consults._today.dart';
import 'consults_past.dart';


class ConsultingTabBar extends StatelessWidget {
  const ConsultingTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25.0)),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: "Today Consults"),
                    Tab(text: "Past Consults"),
                  ],
                ),
              ),
            ),
          ),
           Expanded(
            child: TabBarView(
              children: [
                ConsultsToday(),
               Container(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
