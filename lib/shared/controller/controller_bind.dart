import 'package:get/get.dart';
import 'package:intake_customer/features/login/api_login.dart';
import 'package:intake_customer/features/login/controller_login.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ControllerUserInfo());
    Get.put(ControllerLogin(api: ApiLogin()));
  }
}