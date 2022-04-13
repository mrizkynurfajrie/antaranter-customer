
import 'package:get/get.dart';
import 'package:intake_customer/features/api_log/controller_api_log.dart';

class BindingApiLog implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerApiLog>(() {
      return ControllerApiLog();
    });
  }
}
