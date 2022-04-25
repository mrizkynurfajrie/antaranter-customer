import 'package:get/get.dart';
import 'package:intake_customer/features/forget_password/controller_forgetpassword.dart';

class BindingForgetPassword implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerForgetPassword>(() => ControllerForgetPassword());
  }
}