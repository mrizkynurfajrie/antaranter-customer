import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../shared/widgets/pages/page_decoration_top.dart';
import 'controller_login.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 2,
      center: AppLogos.logoAppBar(
        AppLogos.logoHorizontalPng,
      ),
      title: "IN-TAKE",
      enableBack: false,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formkeyLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(
                    "SIGN IN",
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
                    "Sudah punya akun? Yuk, masuk!",
                    style: TextStyle(
                      fontSize: 18,
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
                      textFieldController: controller.edtPhoneControl,
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
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Obx(()=> TextFormField(
                      obscureText: controller.obsecurePass.value,
                      controller: controller.edtPassword,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                          suffixIcon: GestureDetector(
                            onTap: ()=> controller.showPass(),
                            child: controller.obsecurePass.value == true
                                ? const Icon(CupertinoIcons.eye_solid)
                                : const Icon(CupertinoIcons.eye_slash)
                            ,
                          )
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Nomor Ponsel anda salah';
                        } else {
                          return null;
                        }
                      },
                    )),
                  ),
                ),
                Obx(() => Container(
                      margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                      child: controller.loading.isFalse
                          ? uiComponent().buttonStyle_one(
                              'Sign In',
                              context,
                              AppColor.primaryColor.shade400,
                              () {
                                dismisKeyboard();
                                controller.validator();
                              },
                            )
                          : loadingIndicator(context),
                    ),),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                            color: AppColor.bodyColor.shade600,
                            fontSize: 16,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Belum punya '),
                          TextSpan(
                              text: 'akun? ',
                              style: TextStyle(color: AppColor.primaryColor.shade600, fontWeight: FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                              ..onTap = ()=> controller.regisRoute()
                          ),
                          const TextSpan(text: 'Atau lupa '),
                          TextSpan(
                              text: 'password?',
                              style: TextStyle(color: AppColor.primaryColor.shade600, fontWeight: FontWeight.w500),
                              recognizer: TapGestureRecognizer()
                            ..onTap = ()=> controller.forgetPasswordRoute()
                          ),
                        ]
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
