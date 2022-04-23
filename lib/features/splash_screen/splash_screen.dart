import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/splash_screen/controller_splash.dart';

class PageSplash extends GetView<ControllerSplash> {
  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xffFF6600),
                  Color(0xffFF2500),
                ])
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset('assets/images/city-dark.svg', fit: BoxFit.fitWidth),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: Get.height * 0.2.h,
                  child: SvgPicture.asset('assets/icons/logo-white.svg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
