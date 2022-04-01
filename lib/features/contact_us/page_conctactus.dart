import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/contact_us/controller_contactus.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';

class PageContactUs extends StatelessWidget {
  const PageContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contactController = Get.put(ControllerContactUs());
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Text('Contact Us', style: TextStyle(fontWeight: FontWeight.w600),),
        foregroundColor: AppColor.primaryColor.shade300,
        backgroundColor: AppColor.whiteColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  child: const Image(image: AssetImage('assets/logo/logo-besar.png')),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Text(
                    'Jika butuh bantuan kami\nMohon hubungi pada kontak berikut',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.bodyColor.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                uiComponent().baseLineDarkColor(context),
                // GestureDetector(
                //   onTap: ()=> contactController.ourWa(),
                //   child: Container(
                //     margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                //     height: Get.height * 0.10,
                //     width: Get.width,
                //     child: Card(
                //       elevation: 4,
                //       shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(20))
                //       ),
                //       child: Row(
                //         children: <Widget>[
                //           Container(
                //               margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                //               child: Image.asset(AppIcons.wa)),
                //           Container(
                //               margin: const EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
                //               child: Text(
                //                 'WhatsApp',
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.w300,
                //                     fontSize: 20,
                //                     color: AppColor.bodyColor.shade600),
                //               )
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: ()=> contactController.ourIg(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Image.asset(AppIcons.ig)),
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
                              child: Text(
                                'Instagram',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=> contactController.ourFb(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Image.asset(AppIcons.fb)),
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
                              child: Text(
                                'Facebook',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=> contactController.ourEmail(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Image.asset(AppIcons.email)),
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=> contactController.ourWeb(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Image.asset(AppIcons.web)),
                          Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 10),
                              child: Text(
                                'Web',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
