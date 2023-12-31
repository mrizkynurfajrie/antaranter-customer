import 'package:get/get.dart';
import 'package:intake_customer/features/home/api_home.dart';
import 'package:intake_customer/response/ads.dart';
import 'package:intake_customer/response/home_response.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:location/location.dart';

class ControllerHome extends GetxController {
  final ApiHome api;

  ControllerHome({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();

  var homeResponse = HomeResponse().obs;

  var loading = true.obs;

  Location location = Location();

  @override
  void onInit() {
    getData();
  }

  void getData() async {
    loading.value = true;
    try {
      // await Future.delayed(Duration(seconds: 5));
      var res = await api.homeUser(controllerUserInfo.user.value.id ?? 0);
      // log(res.toString());
      if (res['success'] == true) {
        homeResponse.value = HomeResponse.fromJson(res['data']);
        if (homeResponse.value.user != null) {
          controllerUserInfo.user.value = homeResponse.value.user!;
        }
      }
      homeResponse.value.adsResponse?.ads = getCategoryList(homeResponse.value.adsResponse?.ads);
      controllerUserInfo.user.refresh();
      homeResponse.refresh();
      loading.value = false;
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", "Terjadi kesalahan");
    }
  }

  List<Ads?>? getCategoryList(List<Ads?>? listAds) {
    List<Ads?>? outputList = List<Ads>.empty();
    if (listAds != null) {
      outputList = listAds.where((o) {
        int diff = o?.createdAt?.difference(DateTime.now()).inDays ?? 0;
        int durationLeft = o!.duration! - diff.abs();
        if (durationLeft > 0) {
          return true;
        } else {
          return false;
        }
      }).toList();
      return outputList;
    }
    return outputList;
  }
}
