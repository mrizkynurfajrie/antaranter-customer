import 'package:get/get.dart';
import 'package:intake_customer/features/main/controller_main.dart';

class BindingMain implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerMain>(() => ControllerMain());
  }
}