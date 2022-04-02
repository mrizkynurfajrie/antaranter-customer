import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/user.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';

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

  routeToAboutApp(){
    Get.toNamed(Routes.aboutApp);
  }

  logout()async{
    Get.find<ControllerUserInfo>().user.value = User();
    Get.find<ControllerUserInfo>().hasActiveOrder.value = false;
    await Api2().removeStorageForLogout();
    Get.offAllNamed(Routes.INITIAL);
  }
}