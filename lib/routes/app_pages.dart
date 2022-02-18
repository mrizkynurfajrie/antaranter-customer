import 'package:get/get.dart';
import 'package:intake_customer/features/create_order/page_create_order.dart';
import 'package:intake_customer/features/home/page_home.dart';
import 'package:intake_customer/features/login/page_login.dart';
import 'package:intake_customer/features/main/binding_main.dart';
import 'package:intake_customer/features/main/page_main.dart';
import 'package:intake_customer/features/profile/page_profile.dart';

import 'app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const PageLogin(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const PageHome(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const PageProfile(),
    ),
    GetPage(
      name: Routes.create_order,
      page: () => const PageCreateOrder(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const PageMain(),
      binding: BindingMain()
    ),
  ];
}