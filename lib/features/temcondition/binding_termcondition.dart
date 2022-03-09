import 'package:get/get.dart';
import 'package:intake_customer/features/temcondition/controller_termcondition.dart';

class BindingTermCondition implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerTermCondition>(() => ControllerTermCondition());
  }
}