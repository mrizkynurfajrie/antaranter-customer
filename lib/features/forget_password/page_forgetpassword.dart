import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/forget_password/controller_forgetpassword.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PageForgetPassword extends GetView<ControllerForgetPassword> {
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
        child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formkeyForgetPass,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 30),
                        child: Text(
                          "FORGET PASSWORD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColor.bodyColor.shade800,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      uiComponent().baseLinePrimaryColor(context),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "Lupa password? Yuk, perbaiki!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (value) {},
                            formatInput: false,
                            textFieldController: controller.edtPhoneInput,
                            initialValue: controller.number,
                            hintText: '+628xxx',
                            inputBorder: InputBorder.none,
                            validator: (value) {
                              if (value == null || value.length < 11 || value.length > 11) {
                                return 'Nomor Ponsel anda salah';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      Obx(() => Container(
                        margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                        child: controller.loading.isFalse
                            ? uiComponent().buttonStyle_one(
                          'Change Password',
                          context,
                          AppColor.primaryColor.shade400,
                              () => controller.validator(),
                        )
                            : loadingIndicator(context),
                      )),
                    ],
                  )
              ),
            )
        ),
      );
}
