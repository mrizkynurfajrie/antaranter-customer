import 'package:get/get.dart';
import 'package:intake_customer/features/contact_us/controller_contactus.dart';

class BindingContactUs implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerContactUs>(() => ControllerContactUs());
  }
}