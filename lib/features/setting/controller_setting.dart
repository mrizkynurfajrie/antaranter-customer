import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/routes/app_routes.dart';

class ControllerSetting extends GetxController{

  routeToverifikasi(){
    Get.toNamed(Routes.verifikasi);
  }

  routeToTermCondition(){
    Get.toNamed(Routes.termcondition);
  }

  routeToContactUs(){
    Get.toNamed(Routes.contactus);
  }

  logout()async{
    await Api2().removeStorageForLogout();
    Get.offAllNamed(Routes.INITIAL);
  }
}