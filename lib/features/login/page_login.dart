import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'controller_login.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: AppLogos.logoAppBar(AppLogos.logoColored),
        backgroundColor: AppColor.whiteColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    onInputChanged: (PhoneNumber value) {},
                    textFieldController: controller.edtPhoneControl,
                    initialValue: controller.number,
                    hintText: 'Phone Number',
                    inputBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: uiComponent().edtPassField(controller.edtPassword,
                      prefIcon: const Icon(CupertinoIcons.lock_fill)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                child: uiComponent().buttonStyle_one(
                  'Sign In',
                  context,
                  AppColor.primaryColor.shade400,
                  () {
                    dismisKeyboard();
                    controller.login();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Align(
                  child: TextButton(
                    onPressed: () => controller.regisRoute(),
                    child: Text(
                      "Belum punya akun? Yuk, buat!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.bodyColor.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
