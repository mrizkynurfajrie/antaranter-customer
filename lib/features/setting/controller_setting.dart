import 'package:get/get.dart';
import 'package:intake_customer/routes/app_routes.dart';

class ControllerSetting extends GetxController{
  routeToTermCondition(){
    Get.toNamed(Routes.termcondition);
  }
  routeToverifikasi(){
    Get.toNamed(Routes.verifikasi);
  }
}