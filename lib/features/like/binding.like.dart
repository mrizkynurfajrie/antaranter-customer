import 'package:get/get.dart';
import 'package:intake_customer/features/like/api_like.dart';
import 'package:intake_customer/features/like/controller_like.dart';

class BindingLike extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerLike>(() => ControllerLike(api: ApiLike()));
  }
}