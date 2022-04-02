import 'package:get/get.dart';
import 'package:intake_customer/features/about_app/controller_aboutapp.dart';

class BindingAboutApp implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerAboutApp>(() => ControllerAboutApp());
  }
}