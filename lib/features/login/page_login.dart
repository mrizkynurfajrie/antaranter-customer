import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'controller_login.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Color(0xfff5f5f5)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0, left: 30),
                  child: Image(
                    image: AssetImage("assets/logo/logo-besar.png"),
                    height: 100,
                    width: 200,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 30),
                  child: Text(
                    "Mau barang cepat sampai?\nSini biar kami antar!",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.primaryColor.shade400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Sudah punya akun? Yuk, Masuk!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
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
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: uiComponent().edtField(controller.edtPassword,
                        prefIcon: Icon(CupertinoIcons.lock_fill)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 35, right: 35),
                  child: uiComponent().buttonStyle_one(
                      'Sign In',
                      context,
                      AppColor.primaryColor.shade400,
                          ()=> controller.login()
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: (){},
                      child: Text(
                        "Belum punya akun? Yuk, buat!",
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
            )
          ],
        ),
      ),
    );
  }
}