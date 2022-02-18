import 'package:get/get.dart';
import 'package:intake_customer/features/home/page_home.dart';
import 'package:intake_customer/features/login/page_login.dart';

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
  ];
}