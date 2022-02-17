import 'package:get/get.dart';
import 'package:intake_customer/features/login/api_login.dart';
import 'package:intake_customer/features/login/controller_login.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ControllerLogin(api: ApiLogin()));
  }
}