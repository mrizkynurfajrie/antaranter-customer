import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/register/controller_register.dart';
import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PageRegister extends GetView<ControllerRegister>{
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: AppLogos.logoAppBar(AppLogos.logoColored),
          backgroundColor: AppColor.whiteColor,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
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
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "Yuk, gabung sama kami!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber value) {},
                      textFieldController: controller.edtPhoneNum,
                      initialValue: controller.numberID,
                      hintText: 'Phone Number',
                      inputBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: uiComponent().edtPassField(
                        controller.edtPswd,
                        prefIcon: Icon(CupertinoIcons.lock_fill)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 35, right: 35),
                  child: uiComponent().buttonStyle_one(
                      'Sign Up',
                      context,
                      AppColor.primaryColor.shade400,
                          () => controller.register()
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Pastikan nomor ponsel anda aktif & dapat digunakan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.bodyColor.shade600,
                          fontSize: 14
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      );

}