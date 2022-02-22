import 'package:get/get.dart';
import 'package:intake_customer/features/home/api_home.dart';
import 'package:intake_customer/features/home/controller_home.dart';

class BindingHome implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
  }
}