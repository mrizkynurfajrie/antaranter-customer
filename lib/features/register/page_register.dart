import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/register/controller_register.dart';
import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/buttons/button_text.dart';
import 'package:intake_customer/shared/widgets/others/checkbox_label.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 2,
      center: Row(
        children: [
          AppLogos.logoAppBar(AppLogos.logoMark),
          horizontalSpace(Insets.med),
          Text(
            "AntarAnter",
            style: TextStyles.textLogo,
          ),
        ],
      ),
      title: "IN-TAKE",
      enableBack: false,
      child: Obx(()=> SafeArea(
          child: SingleChildScrollView(
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
                      textFieldController: controller.edtPhoneNum,
                      initialValue: controller.numberID,
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
                    child: uiComponent().edtPassField(controller.edtPswd,
                        prefIcon: const Icon(CupertinoIcons.lock_fill)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 0, left: 36.5, right: 20),
                  child: CheckboxLabel(onChange: (status) {
                    controller.regisAgreemnet(status);
                  }, label: 'Saya telah setuju dengan syarat & ketentuan\naplikasi',),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                  child: 
                  controller.loading.isFalse ? 
                  uiComponent().buttonStyle_one(
                    'Sign Up',
                    context,
                    AppColor.primaryColor.shade400,
                        () => controller.checkAgreement(),
                  ):loadingIndicator(context),
                ),
                Visibility(
                  visible: controller.regisAgree.value,
                  child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ButtonText(
                          onPressed: ()=> controller.termCondtionPage(),
                          textStyle: TextStyle(color: AppColor.primaryColor.shade600, fontWeight: FontWeight.w400),
                          label: 'Mohon perhatikan syarat dan ketentuan kami'),
                  ),
                )
              ],
            ),
          ),
        )),
      );
}
