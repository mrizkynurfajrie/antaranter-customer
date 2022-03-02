import 'package:get/get.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'api_profile.dart';

class ControllerProfile extends GetxController {
  final ApiProfile api;
  ControllerProfile({required this.api});

  routingPageHistory(){
    Get.toNamed(Routes.history);
  }
  routingPageLike(){
    Get.toNamed(Routes.like);
  }
  routingPageSetting(){
    Get.toNamed(Routes.setting);
  }
}
