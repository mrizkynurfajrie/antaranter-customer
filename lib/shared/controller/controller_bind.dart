import 'package:get/get.dart';
import 'package:intake_customer/features/login/api_login.dart';
import 'package:intake_customer/features/login/controller_login.dart';
import 'package:intake_customer/features/splash_screen/controller_splash.dart';
import 'package:intake_customer/shared/controller/controller_notification.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ControllerSplash());
    Get.put(ControllerUserInfo());
    Get.put(ControllerNotification());
    Get.put(ControllerLogin(api: ApiLogin()));
  }
}