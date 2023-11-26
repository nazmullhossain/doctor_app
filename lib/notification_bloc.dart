
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';


import 'package:rxdart/rxdart.dart';

import 'model/push_model.dart';
import 'notification-badge.dart';



class NotificationBloc {
  final BehaviorSubject<PushNotification> _subject =
  BehaviorSubject<PushNotification>();

  notification(PushNotification pushNotification) async {
    _subject.sink.add(pushNotification);
    showSimpleNotification(
        InkWell(
          onTap: () {

            //Get.to(NotificationScreen());

          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NotificationBadge(totalNotifications: 1),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( pushNotification.dataTitle!,style: TextStyle(
                          color: Colors.black
                      ),),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(pushNotification.dataBody!,
                        style:  TextStyle(fontSize: 12,color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // leading: const NotificationBadge(totalNotifications: 1),
        // subtitle: Text(pushNotification.body!.isNotEmpty
        //     ? pushNotification.body!
        //     : pushNotification.dataBody!),
        background: Colors.white,
        // autoDismiss: true,
        slideDismiss: true,
        duration: const Duration(seconds: 20),
        slideDismissDirection: DismissDirection.startToEnd);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PushNotification> get subject => _subject;
}

final notificationBloc = NotificationBloc();
