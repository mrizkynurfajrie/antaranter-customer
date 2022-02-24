import 'package:get/get.dart';
import 'package:intake_customer/features/register/controller_register.dart';
import 'api_register.dart';

class BindingRegister implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerRegister>(() {
      return ControllerRegister(api: ApiRegister());
    });
  }

}