import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/profile/api_profile.dart';
import 'package:intake_customer/features/profile/controller_profile.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/pages/page_decoration_top.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileControl = Get.put(ControllerProfile(api: ApiProfile()));
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      center: AppLogos.logoAppBar(AppLogos.logoColored),
      title: "IN-TAKE",
      enableBack: false,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: Get.height,
              width: Get.width,
              color: AppColor.bgPageColor,
            ),
            Column(
              children: <Widget>[
                Container(
                  // height: Get.height *0.25,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor.shade300,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                    ),
                    child: Obx(() => Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/images/fajrie.jpg"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            profileControl.nama.value,
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColor.whiteColor
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            profileControl.phone.value,
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.whiteColor
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            profileControl.email.value,
                            style: TextStyles.textTitle,
                          ),
                        ),
                      ],
                    ))
                ),
                GestureDetector(
                  onTap: ()=> profileControl.routingPageHistory(),
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                CupertinoIcons.clock,
                                size: 45,
                                color: AppColor.primaryColor.shade300,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Pesanan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => profileControl.routingPageLike(),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                size: 45,
                                color: AppColor.primaryColor.shade300,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Favorit',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                CupertinoIcons.person_add_solid,
                                size: 45,
                                color: AppColor.primaryColor.shade300,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Ajak Teman',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.motorcycle,
                                size: 45,
                                color: AppColor.primaryColor.shade300,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Bergabung',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => profileControl.routingPageSetting(),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: Get.height * 0.10,
                    width: Get.width,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                CupertinoIcons.gear_solid,
                                size: 45,
                                color: AppColor.primaryColor.shade300,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Pengaturan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColor.bodyColor.shade600),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
