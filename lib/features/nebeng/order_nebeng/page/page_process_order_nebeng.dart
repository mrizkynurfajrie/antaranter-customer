import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:lottie/lottie.dart';

class PageProcessOrderNebeng extends StatelessWidget {
  const PageProcessOrderNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(Insets.xl),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppLogos.logoOnlyPng,
              width: Get.width * 0.4,
            ),
            Lottie.asset(
              AppLotties.loadingProcess,
              width: Get.width * 0.4,
            ),
            Text(
              "Pesanan anda sedang diprosess mohon tunggu...",
              style: TextStyles.textSm,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ));
  }
}
