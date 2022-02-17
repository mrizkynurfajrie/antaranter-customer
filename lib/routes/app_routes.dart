import 'package:get/get.dart';
import 'package:intake_customer/features/login/page_login.dart';

import 'app_pages.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const PageLogin(),
    ),
  ];
}