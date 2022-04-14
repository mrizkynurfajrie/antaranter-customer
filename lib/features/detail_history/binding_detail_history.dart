import 'package:get/get.dart';
import 'package:intake_customer/features/detail_history/api_detail_history.dart';
import 'package:intake_customer/features/detail_history/controller_detail_history.dart';

class BindingDetailHistory extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerDetailHistory>(() => ControllerDetailHistory(api: ApiDetailHistory()));
  }
}