import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/api_detail_nebeng.dart';
import 'package:intake_customer/routes/app_routes.dart';

class ControllerDetailNebeng extends GetxController {
  final ApiDetailNebeng api;
  ControllerDetailNebeng({required this.api});
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void orderNebeng() async {
    Get.toNamed(Routes.processOrderNebeng);
    // TODO CALL API ORDER NEBENG
    await Future.delayed(Duration(seconds: 3));
    // IF SUCCESS GO TO PAGE DETAIL ORDER NEBENG
    Get.offAndToNamed(Routes.main);
  }
}
