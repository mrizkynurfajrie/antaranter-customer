import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:intake_customer/framework/api1.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:url_launcher/url_launcher.dart';
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

  emailInvitation()async{
    var toEmail = "";
    var subject = "Yuk bergaung dengan saya sekrang";
    var message = "Hai, ayo bergabung bersamaku dan dapatkan kemudahan ketika kita ingin pergi]\n...\n";

    var emailUrl = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(emailUrl)) {
        await launch(emailUrl, forceSafariVC: false);
      } else {
        Get.snackbar('Attention', "Something is wrong");
      }
    } else {
      // android , web
      if (await canLaunch(emailUrl)) {
        await launch(emailUrl);
      } else {
        Get.snackbar('Attention', "Something is wrong");
      }
    }
  }
}
