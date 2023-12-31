import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/profile/controller_profile.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:shimmer/shimmer.dart';

class PageProfile extends GetView<ControllerProfile> {
  const PageProfile({Key? key}) : super(key: key);

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
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
                // height: Get.height *0.25,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Obx(() => Column(
                      children: <Widget>[
                        verticalSpace(Insets.med),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: SizedBox(
                            height: 85.w,
                            width: 85.w,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: imageUrlPath(controller.controllerUserInfo.user.value.image??''),
                              progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer(
                                gradient: AppColor.shimmerGradient,
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    color: Color(0xffffffff)),
                                child: Icon(
                                  CupertinoIcons.person_fill,
                                  size: 55,
                                  color: AppColor.bodyColor.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            controller.controllerUserInfo.user.value.username
                                ?? "Pelanggan",
                            style: const TextStyle(fontSize: 20, color: AppColor.whiteColor),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            '+62${controller.controllerUserInfo.user.value.phone}',
                            style: const TextStyle(
                                fontSize: 16, color: AppColor.whiteColor),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            controller.controllerUserInfo.user.value.email ??
                                "email@email.com",
                            style: TextStyles.textTitle,
                          ),
                        ),
                      ],
                    ))),
            GestureDetector(
              onTap: () => controller.routingPageHistory(),
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                height: Get.height * 0.08,
                width: Get.width,
                child: Card(
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Icon(
                            CupertinoIcons.clock,
                            size: 30,
                            color: AppColor.primaryColor.shade300,
                          )),
                      Container(
                          child: Text(
                        'Pesanan',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: AppColor.bodyColor.shade600),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () => controller.routingPageLike(),
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            //     height: Get.height * 0.10,
            //     width: Get.width,
            //     child: Card(
            //       elevation: 4,
            //       shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(20))),
            //       child: Row(
            //         children: <Widget>[
            //           Container(
            //               margin: const EdgeInsets.only(left: 15),
            //               child: Icon(
            //                 CupertinoIcons.heart_fill,
            //                 size: 45,
            //                 color: AppColor.primaryColor.shade300,
            //               )),
            //           Container(
            //               margin: const EdgeInsets.only(left: 10),
            //               child: Text(
            //                 'Favorit',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 20,
            //                     color: AppColor.bodyColor.shade600),
            //               )),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: ()=> controller.emailInvitation(),
              child: Container(
                margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                height: Get.height * 0.08,
                width: Get.width,
                child: Card(
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Icon(
                            CupertinoIcons.person_add_solid,
                            size: 30,
                            color: AppColor.primaryColor.shade300,
                          )),
                      Container(
                          child: Text(
                        'Ajak Teman',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: AppColor.bodyColor.shade600),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            //     height: Get.height * 0.10,
            //     width: Get.width,
            //     child: Card(
            //       elevation: 4,
            //       shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(20))),
            //       child: Row(
            //         children: <Widget>[
            //           Container(
            //               margin: const EdgeInsets.only(left: 15),
            //               child: Icon(
            //                 Icons.motorcycle,
            //                 size: 45,
            //                 color: AppColor.primaryColor.shade300,
            //               )),
            //           Container(
            //               margin: const EdgeInsets.only(left: 10),
            //               child: Text(
            //                 'Bergabung',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 20,
            //                     color: AppColor.bodyColor.shade600),
            //               )),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () => controller.routingPageSetting(),
              child: Container(
                margin: const EdgeInsets.only(
                    top: 5, left: 10, right: 10, bottom: 20),
                height: Get.height * 0.08,
                width: Get.width,
                child: Card(
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Icon(
                            CupertinoIcons.gear_solid,
                            size: 30,
                            color: AppColor.primaryColor.shade300,
                          )),
                      Container(
                          child: Text(
                        'Pengaturan',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
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
      ),
    );
  }
}
