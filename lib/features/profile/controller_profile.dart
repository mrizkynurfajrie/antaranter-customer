import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'api_profile.dart';

class ControllerProfile extends GetxController {
  final ApiProfile api;
  ControllerProfile({required this.api});

  var nama = ''.obs;
  var pict = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;

  @override
  void onInit(){
    setProfile();
    super.onInit();
  }

  setProfile()async{
    var userDetail = await Api2().getUser();
    pict.value = userDetail['image'] ?? "";
    nama.value = userDetail['username'] ?? "Pelanggan";
    phone.value = userDetail['phone'] ?? "08xxxxxxxxxx";
    email.value = userDetail['email'] ?? "name@email.com";
  }

  routingPageHistory(){
    Get.toNamed(Routes.history);
  }
  routingPageLike(){
    Get.toNamed(Routes.like);
  }
  routingPageSetting(){
    Get.toNamed(Routes.setting);
  }
  routingLogout(){
    Get.offAllNamed(Routes.INITIAL);
  }
}
