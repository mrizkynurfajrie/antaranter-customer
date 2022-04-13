import 'package:get/get.dart';
import 'package:intake_customer/features/about_app/binding_aboutapp.dart';
import 'package:intake_customer/features/about_app/page_aboutapp.dart';
import 'package:intake_customer/features/contact_us/binding_contactus.dart';
import 'package:intake_customer/features/contact_us/page_conctactus.dart';
import 'package:intake_customer/features/create_order/page_create_order.dart';
import 'package:intake_customer/features/detail_ads/binding_detail_ads.dart';
import 'package:intake_customer/features/detail_ads/page_detail_ads.dart';
import 'package:intake_customer/features/history/binding_history.dart';
import 'package:intake_customer/features/history/page_history.dart';
import 'package:intake_customer/features/home/page_home.dart';
import 'package:intake_customer/features/like/binding.like.dart';
import 'package:intake_customer/features/like/page_like.dart';
import 'package:intake_customer/features/login/page_login.dart';
import 'package:intake_customer/features/main/binding_main.dart';
import 'package:intake_customer/features/main/page_main.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/binding_detail_nebeng.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/page/page_status_nebeng.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/page_detail_nebeng.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/binding_list_nebeng.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/page_list_nebeng.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/binding_order_nebeng.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/page/page_order_nebeng.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/page/page_process_order_nebeng.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/binding_term_nebeng.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/page_term_nebeng.dart';
import 'package:intake_customer/features/profile/page_profile.dart';
import 'package:intake_customer/features/register/page_register.dart';
import 'package:intake_customer/features/register/binding_register.dart';
import 'package:intake_customer/features/setting/page_setting.dart';
import 'package:intake_customer/features/splash_screen/binding_splash.dart';
import 'package:intake_customer/features/splash_screen/splash_screen.dart';
import 'package:intake_customer/features/temcondition/page_termcondition.dart';
import 'package:intake_customer/features/verifikasi/binding_verifikasi.dart';
import 'package:intake_customer/features/verifikasi/page_verifikasi.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const PageSplash(),
        binding: BindingSplash(),
        transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.login,
      page: () => const PageLogin(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const PageRegister(),
      binding: BindingRegister(),
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
      binding: BindingHistory(),
    ),
    GetPage(
      name: Routes.like,
      page: () => const PageLike(),
      binding: BindingLike(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => const PageSetting(),
    ),
    GetPage(
      name: Routes.termcondition,
      page: () => const PageTermCondition(),
    ),
    GetPage(
      name: Routes.verifikasi,
      page: () => const PageVerifikasi(),
      binding: BindingVerifikasi(),
    ),
    GetPage(
      name: Routes.contactus,
      page: () => const PageContactUs(),
      binding: BindingContactUs(),
    ),
    GetPage(
      name: Routes.create_order,
      page: () => const PageCreateOrder(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const PageMain(),
      binding: BindingMain(),
    ),
    GetPage(
      name: Routes.listNebeng,
      page: () => const PageListNebeng(),
      binding: BindingListNebeng(),
    ),
    GetPage(
      name: Routes.termNebeng,
      page: () => const PageTermNebeng(),
      binding: BindingTermNebeng(),
    ),
    GetPage(
      name: Routes.detailNebeng,
      page: () => const PageDetailNebeng(),
      binding: BindingDetailNebeng(),
    ),
    GetPage(
      name: Routes.processOrderNebeng,
      page: () => const PageProcessOrderNebeng(),
    ),
    GetPage(
      name: Routes.orderNebeng,
      page: () => const PageOrderNebeng(),
      binding: BindingOrderNebeng(),
    ),
    GetPage(
      name: Routes.aboutApp,
      page: () => const PageAboutApp(),
      binding: BindingAboutApp(),
    ),
    GetPage(
      name: Routes.detailAds,
      page: () => const PageDetailAds(),
      binding: BindingDetailAds(),
    ),
    GetPage(
      name: Routes.statusNebeng,
      page: () => const PageStatusNebeng(),
    ),
  ];
}
