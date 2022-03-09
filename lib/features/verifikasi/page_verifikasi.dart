import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/verifikasi/controller_verifikasi.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';

class PageVerifikasi extends GetView<ControllerVerifikasi>{
  const PageVerifikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: AppColor.bgPageColor,
        appBar: AppBar(
          title: const Text('Verifikasi & Atur Profile', style: TextStyle(fontWeight: FontWeight.w600),),
          foregroundColor: AppColor.primaryColor.shade300,
          backgroundColor: AppColor.whiteColor,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Obx(()=> Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => controller.imgSourceSelector(context),
                    child: (controller.Img.value != "")
                        ? Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(controller.Img.toString()),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 20),
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Color(0xffffffff)),
                            child: Icon(
                              CupertinoIcons.person_fill,
                              size: 55,
                              color: AppColor.bodyColor.shade600,
                            ),
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      controller.nama.value,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColor.bodyColor.shade800
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      controller.phone.value,
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.bodyColor.shade600
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(
                      controller.email.value,
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.bodyColor.shade600
                      ),
                    ),
                  ),
                  uiComponent().baseLineDarkColor(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 5, left: 10),
                        height: 50,
                        width: Get.width * 0.55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppColor.whiteColor
                        ),
                        child: uiComponent().edtField(controller.edt_name, 'Nama'),
                      ),
                      GestureDetector(
                        onTap: ()=> controller.inputDate(context),
                        child: Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 5),
                          height: 50,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: AppColor.whiteColor
                          ),
                          child: Center(child: Text(controller.datePick.value)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    height: 50,
                    width: Get.width * 0.825,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColor.whiteColor
                    ),
                    child: uiComponent().edtField(controller.edt_email, 'Email'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    height: 50,
                    width: Get.width * 0.825,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColor.whiteColor
                    ),
                    child: uiComponent().edtField(controller.edt_ponsel, 'No. Ponsel'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    height: 50,
                    width: Get.width * 0.825,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColor.whiteColor
                    ),
                    child: uiComponent().edtField(controller.edt_alamat, 'Alamat'),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: Get.width * 0.825,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColor.whiteColor
                    ),
                    child: uiComponent().edtField(controller.edt_kota, 'Kota'),
                  ),
                  uiComponent().baseLineDarkColor(context)
                ],
              )
              ),
            )
        ),
      );
}