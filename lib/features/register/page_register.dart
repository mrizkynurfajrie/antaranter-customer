import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/register/controller_register.dart';
import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/others/checkbox_label.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PageDecorationTop(
        padding: EdgeInsets.zero,
        backgroundColor: AppColor.bgPageColor,
        toolbarColor: AppColor.whiteColor,
        toolbarElevation: 2,
        center: AppLogos.logoAppBar(
        AppLogos.logoHorizontalPng,
      ),
        title: "IN-TAKE",
        toolbarTitleColor: AppColor.primaryColor.shade400,
        enableBack: true,
        child: Obx(() => SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formkeyRegis,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Text(
                          "SIGN UP",
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
                          "Yuk, gabung sama kami!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber value) {},
                            formatInput: false,
                            textFieldController: controller.edtPhoneNum,
                            initialValue: controller.numberID,
                            hintText: '+628xxx',
                            inputBorder: InputBorder.none,
                            validator: (value) {
                              if (value == null ||
                                  value.length < 9 ||
                                  value.length > 11 ||
                                  value.characters.characterAt(0).contains(0.toString())
                              ) {
                                return 'Nomor Ponsel anda salah';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Obx(()=> TextFormField(
                            obscureText: controller.obsecurePass.value,
                            controller: controller.edtPswd,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                contentPadding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                                suffixIcon: GestureDetector(
                                  onTap: ()=> controller.showPass(),
                                  child: controller.obsecurePass.value == true
                                      ? const Icon(CupertinoIcons.eye_solid)
                                      : const Icon(CupertinoIcons.eye_slash),
                                )
                            ),
                            validator: (value) {
                              if (value == null || value == '' || value.length < 6) {
                                return 'Kata sandi anda salah';
                              } else {
                                return null;
                              }
                            },
                          )),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 0, left: 36.5, right: 20),
                        child: CheckboxLabel(
                          label: 'Saya setuju dengan syarat & ketentuan aplikasi',
                          onChange: (status) => controller.regisAgreemnet(status),
                          labelStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 35, right: 35),
                        child: controller.loading.isFalse
                            ? uiComponent().buttonStyle_one(
                                'Sign Up',
                                context,
                                AppColor.primaryColor.shade400,
                                () => controller.checkAgreement(),
                              )
                            : loadingIndicator(context),
                      ),
                      Visibility(
                        visible: controller.regisAgree.value,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.bodyColor.shade600,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Berikut adalah '),
                                    TextSpan(
                                        text: 'Syarat & Ketentuan',
                                        style: TextStyle(color: AppColor.primaryColor.shade600, fontWeight: FontWeight.w500),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = ()=> controller.termCondtionPage()
                                    ),
                                    TextSpan(text: ' aplikasi'),
                                  ]
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      );
}
