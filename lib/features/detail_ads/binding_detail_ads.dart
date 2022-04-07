import 'package:get/get.dart';
import 'package:intake_customer/features/detail_ads/controller_detail_ads.dart';

class BindingDetailAds implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerDetailAds>(() => ControllerDetailAds());
  }
}