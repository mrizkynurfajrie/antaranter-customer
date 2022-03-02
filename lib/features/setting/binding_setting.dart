import 'package:get/get.dart';
import 'package:intake_customer/features/setting/controller_setting.dart';

class BindingSetting implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerSetting>(() => ControllerSetting());
  }
}