import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'api_profile.dart';

class ControllerProfile extends GetxController {
  final ApiProfile api;
  ControllerProfile({required this.api});

  var nama = ''.obs;
  var pict = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var profilImg = ''.obs;

  @override
  void onInit(){
    setProfile();
    super.onInit();
  }

  Future<void> onRefresh()async{
    try{
      await Future.delayed(Duration(milliseconds: 1000));
      setProfile();
    }catch(e){
      log(e.toString());
    }
  }

  setProfile()async{
    var userDetail = await Api2().getUser();
    pict.value = userDetail['image'] ?? "";
    nama.value = userDetail['username'] ?? "Pelanggan";
    phone.value = userDetail['phone'] ?? "08xxxxxxxxxx";
    email.value = userDetail['email'] ?? "name@email.com";
    profilImg.value = "https://api.intakekurir.com/images/${pict.value}";

  }
  var controllerUserInfo = Get.find<ControllerUserInfo>();

  routingPageHistory() {
    Get.toNamed(Routes.history);
  }

  routingPageLike() {
    Get.toNamed(Routes.like);
  }

  routingPageSetting() {
    Get.toNamed(Routes.setting);
  }

  routingLogout() async {

    await Api2().removeStorageForLogout();
    Get.offAllNamed(Routes.INITIAL);
  }
}
