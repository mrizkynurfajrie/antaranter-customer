import 'package:get/get.dart';
import 'package:intake_customer/features/history/api_history.dart';
import 'package:intake_customer/features/history/controller_history.dart';

class BindingHistory extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerHistory>(() => ControllerHistory(api: ApiHistory()));
  }
}