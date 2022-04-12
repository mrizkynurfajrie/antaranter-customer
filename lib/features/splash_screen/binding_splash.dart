import 'package:get/get.dart';
import 'package:intake_customer/features/splash_screen/controller_splash.dart';

class BindingSplash implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerSplash>(() => ControllerSplash());
  }
}