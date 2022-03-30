import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/setting/controller_setting.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class PageSetting extends StatelessWidget {
  const PageSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingController = Get.put(ControllerSetting());
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      appBar: AppBar(
        title: const Text('Pengaturan', style: TextStyle(fontWeight: FontWeight.w600),),
        foregroundColor: AppColor.primaryColor.shade300,
        backgroundColor: AppColor.whiteColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: ()=> settingController.routeToverifikasi(),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Text(
                                'Verifikasi & Atur Akun',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 15,
                                color: AppColor.primaryColor.shade300,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=> settingController.routeToTermCondition(),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Text(
                                'Syarat & Ketentuan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 15,
                                color: AppColor.primaryColor.shade300,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Text(
                                'Tentang Aplikasi',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 15,
                                color: AppColor.primaryColor.shade300,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Text(
                                'Tentang Kami',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 15,
                                color: AppColor.primaryColor.shade300,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=> settingController.routeTovContactUs(),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Text(
                                'Hubungi Kami',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 15,
                                color: AppColor.primaryColor.shade300,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                              child: Text(
                                'Nilai Kami',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                              child: Icon(
                                CupertinoIcons.right_chevron,
                                size: 15,
                                color: AppColor.primaryColor.shade300,
                              ))
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
