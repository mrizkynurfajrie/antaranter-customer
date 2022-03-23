import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class ControllerNotification extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initNotificationHandler();
  }

  void initNotificationHandler() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("instance");
      
    });

    // only work in foreground
    FirebaseMessaging.onMessage.listen((message) {
      print("onMessage");
    });

    // when the app is in backgroudn but opened
    // User tap notification in tray
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("onMessageOpenedApp");
    });
  }
}
