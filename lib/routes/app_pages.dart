import 'package:get/get.dart';
import 'package:intake_customer/features/create_order/page_create_order.dart';
import 'package:intake_customer/features/history/binding_history.dart';
import 'package:intake_customer/features/history/page_history.dart';
import 'package:intake_customer/features/home/page_home.dart';
import 'package:intake_customer/features/like/binding.like.dart';
import 'package:intake_customer/features/like/page_like.dart';
import 'package:intake_customer/features/login/page_login.dart';
import 'package:intake_customer/features/main/binding_main.dart';
import 'package:intake_customer/features/main/page_main.dart';
import 'package:intake_customer/features/profile/page_profile.dart';
import 'package:intake_customer/features/register/page_register.dart';
import 'package:intake_customer/features/register/binding_register.dart';

import 'app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const PageLogin(),
    ),
    GetPage(
        name: Routes.register,
        page: () => const PageRegister(),
        binding: BindingRegister()
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
      name: Routes.history,
      page: () => const PageHistory(),
      binding: BindingHistory()
    ),
    GetPage(
        name: Routes.like,
        page: () => const PageLike(),
        binding: BindingLike()
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