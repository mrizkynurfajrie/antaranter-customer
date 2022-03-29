import 'package:get/get.dart';
import 'package:intake_customer/routes/app_routes.dart';

class ControllerSetting extends GetxController{

  routeToverifikasi(){
    Get.toNamed(Routes.verifikasi);
  }

  routeToTermCondition(){
    Get.toNamed(Routes.termcondition);
  }

  routeTovContactUs(){
    Get.toNamed(Routes.contactus);
  }
}