import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/controller_term_nebeng.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/others/checkbox_label.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';

class PageTermNebeng extends GetView<ControllerTermNebeng> {
  const PageTermNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      appBar: const CustomAppBar(
        color: Colors.white,
        title: "Syarat dan ketentuan",
        colorTitle: AppColor.primaryColor,
        useLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(Insets.med),
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                AppIcons.termsIcon,
                fit: BoxFit.contain,
              ),
            ),
            verticalSpace(Insets.lg),
            Text(
              "Syarat dan ketentuan",
              style: TextStyles.h5.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "Nebeng",
              style: TextStyles.h5.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: Insets.lg,
                vertical: Insets.med,
              ),
              padding: EdgeInsets.all(Insets.med),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColor.primaryColor,
                ),
                borderRadius: BorderRadius.circular(Insets.lg),
              ),
              height: Get.height * 0.45.h,
              width: Get.width,
              child: Obx(
                () => controller.loading.isFalse
                    ? Scrollbar(
                        child: ListView(
                          children: [
                            Html(
                              data: controller.termCondition.value.skDesc,
                            ),
                          ],
                        ),
                      )
                    : loadingIndicatorBottom(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.xl),
              child: Obx(
                () => CheckboxLabel(
                  active: controller.loading.isFalse,
                  onChange: (status) {
                    controller.changeAgreemnetStatus(status);
                  },
                  label: "Saya telah baca dan menyetujui syarat dan ketentuan",
                  colorBorder: AppColor.primaryColor,
                  labelStyle: TextStyles.textStd,
                ),
              ),
            ),
            verticalSpace(Insets.lg),
            Obx(
              () => ButtonPrimary(
                enable: controller.agreementStatus.value,
                margin: EdgeInsets.symmetric(horizontal: Insets.med),
                cornerRadius: Corners.xl,
                color: AppColor.primaryColor,
                size: Get.width,
                label: "LANJUT",
                onPressed: () {
                  controller.agreeTermNebeng();
                  Get.toNamed(Routes.listNebeng);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
