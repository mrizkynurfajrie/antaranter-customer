
import 'package:get/get.dart';
import 'package:intake_customer/features/login/controller_login.dart';

import 'api_login.dart';

class BindingLogin implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerLogin>(() {
      return ControllerLogin(api: ApiLogin());
    });
  }
}