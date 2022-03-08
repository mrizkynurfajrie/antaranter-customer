import 'package:get/get.dart';
import 'package:intake_customer/features/home/api_home.dart';
import 'package:intake_customer/features/home/controller_home.dart';
import 'package:intake_customer/features/main/controller_main.dart';
import 'package:intake_customer/features/profile/api_profile.dart';
import 'package:intake_customer/features/profile/controller_profile.dart';

class BindingMain implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerMain>(() => ControllerMain());
  Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
  Get.lazyPut<ControllerProfile>(() => ControllerProfile(api: ApiProfile()));
  }
}