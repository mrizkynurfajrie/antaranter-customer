import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';

class PageForgetPassword extends GetView<PageForgetPassword> {
  const PageForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      PageDecorationTop(
        title: "IN-TAKE",
        toolbarElevation: 2,
        padding: EdgeInsets.zero,
        toolbarColor: AppColor.whiteColor,
        backgroundColor: AppColor.bgPageColor,
        toolbarTitleColor: AppColor.primaryColor.shade400,
        center: AppLogos.logoAppBar(AppLogos.logoHorizontalPng),
        child: Container(),
      );
}
