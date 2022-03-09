import 'package:get/get.dart';
import 'package:intake_customer/features/verifikasi/api_verifikasi.dart';
import 'package:intake_customer/features/verifikasi/controller_verifikasi.dart';

class BindingVerifikasi implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerVerifikasi>(() => ControllerVerifikasi(api: ApiVerifikasi()));
  }
}