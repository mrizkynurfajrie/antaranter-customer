import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/register/controller_register.dart';
import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PageRegister extends GetView<ControllerRegister>{
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                uiComponent().baseBackgroundColor(context),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Pastikan data diri anda benar & lengkap',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87),
                      ),
                    ),
                    uiComponent().baseLineDarkColor(context),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
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
                            borderRadius: BorderRadius.circular(15)),
                        child: uiComponent().edtField(controller.edtPswd,
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
                )
              ],
            ),
          ),
        ),
      );

}