import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/controller_term_nebeng.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/others/checkbox_label.dart';

class PageTermNebeng extends GetView<ControllerTermNebeng> {
  const PageTermNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      appBar: CustomAppBar(
        color: Colors.white,
        title: "Syarat dan ketentuan",
        colorTitle: AppColor.primaryColor,
        useLeading: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(Insets.med),
            SizedBox(
              height: 100,
              width: 100,
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
              height: Get.height * 0.45,
              child: Scrollbar(
                child: ListView(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "1. ",
                        style:
                            TextStyles.subtitle1.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.",
                            style: TextStyles.textStd,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "1. ",
                        style:
                            TextStyles.subtitle1.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.",
                            style: TextStyles.textStd,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "1. ",
                        style:
                            TextStyles.subtitle1.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.",
                            style: TextStyles.textStd,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "1. ",
                        style:
                            TextStyles.subtitle1.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.",
                            style: TextStyles.textStd,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "1. ",
                        style:
                            TextStyles.subtitle1.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.",
                            style: TextStyles.textStd,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "1. ",
                        style:
                            TextStyles.subtitle1.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.",
                            style: TextStyles.textStd,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "1. ",
                        style:
                            TextStyles.subtitle1.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.",
                            style: TextStyles.textStd,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.xl),
              child: CheckboxLabel(
                onChange: (status) {
                  controller.changeAgreemnetStatus(status);
                },
                label: "Saya telah baca dan menyetujui syarat dan ketentuan",
                colorBorder: AppColor.primaryColor,
                labelStyle: TextStyles.textStd,
              ),
            ),
            verticalSpace(Insets.lg),
            Obx(
              () => ButtonPrimary(
                enable: controller.agreementStatus.value,
                margin: EdgeInsets.symmetric(horizontal: Insets.med),
                cornerRadius: 15,
                color: AppColor.primaryColor,
                size: Get.width,
                label: "LANJUT",
                onPressed: () {
                  Get.toNamed(Routes.listNebeng);
                },
              ),
            ),
            verticalSpace(Insets.lg),
          ],
        ),
      ),
    );
  }
}
