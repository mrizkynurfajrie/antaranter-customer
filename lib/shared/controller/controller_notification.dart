import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/helpers/local_notification_service.dart';

class ControllerNotification extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initNotificationHandler();
  }

  void initNotificationHandler() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      log("instance");
      
    });

    // only work in foreground
    FirebaseMessaging.onMessage.listen((message) {
      log("onMessage");
      LocalNotificationService.displayNotification(message);
    });

    // when the app is in backgroudn but opened
    // User tap notification in tray
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("onMessageOpenedApp");
    });
  }
}
