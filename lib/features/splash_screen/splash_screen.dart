import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/splash_screen/controller_splash.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class PageSplash extends GetView<ControllerSplash> {
  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: Get.height * 0.2.h,
              child: SvgPicture.asset('assets/logo/AntarAnter-Vertical-SVG.svg'),
            ),
          ),
          // Center(
          //   child: Container(
          //     child: const Text(
          //       'Mau pergi? Sama kita aja!',
          //       style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.w400,
          //         color: Color(0xFFC75200)
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
