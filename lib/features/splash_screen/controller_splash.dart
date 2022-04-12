import 'dart:async';
import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/routes/app_routes.dart';

class ControllerSplash extends GetxController {
  @override
  void onInit() async {
    // Timer(Duration(seconds: 3), splashAnimation());
    splashAnimation();
    super.onInit();
  }

  splashAnimation() async {
    Future.delayed(const Duration(seconds: 3));
    var statusLogin = await Api2().getLoginStatus();
    if (statusLogin == true) {
      Get.offNamed(Routes.main);
    } else {
      Get.offNamed(Routes.login);
    }
  }
}
