import 'dart:developer';
import 'package:get/get.dart';
import 'package:intake_customer/framework/api1.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'api_profile.dart';

class ControllerProfile extends GetxController {
  final ApiProfile api;
  ControllerProfile({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();

  var img = '';
  var imgShow = ''.obs;

  @override
  void onInit() {
    profileImg();
    super.onInit();
  }

  profileImg(){
    img = controllerUserInfo.user.value.image ?? '';
    imgShow.value = Api1().imgUrl+img.toString();
    log('cek img : ' + imgShow.value);
  }

  routingPageHistory() {
    Get.toNamed(Routes.history);
  }

  routingPageLike() {
    Get.toNamed(Routes.like);
  }

  routingPageSetting() {
    Get.toNamed(Routes.setting);
  }
}
