import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/verifikasi/controller_verifikasi.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';

class PageVerifikasi extends GetView<ControllerVerifikasi> {
  const PageVerifikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.bgPageColor,
        appBar: AppBar(
          title: const Text(
            'Verifikasi & Atur Profile',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          foregroundColor: AppColor.primaryColor.shade300,
          backgroundColor: AppColor.whiteColor,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Obx(() => Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => controller.imgSourceSelector(context),
                      child: (controller.imgPreview != "")
                          ? Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  File(controller.imgPreview.value),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.topCenter,
                              margin: const EdgeInsets.only(top: 20),
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
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        controller.mainController.user.value.username ??
                            'Username',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColor.bodyColor.shade800),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        controller.mainController.user.value.phone ??
                            '0812xxxxxxxx',
                        style: TextStyle(
                            fontSize: 14, color: AppColor.bodyColor.shade600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        controller.mainController.user.value.email ??
                            'user@email.com',
                        style: TextStyle(
                            fontSize: 14, color: AppColor.bodyColor.shade600),
                      ),
                    ),
                    uiComponent().baseLineDarkColor(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, right: 5, left: 10),
                          height: 50,
                          width: Get.width * 0.55,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: AppColor.whiteColor),
                          child: uiComponent()
                              .edtField(controller.edt_name, 'Nama'),
                        ),
                        GestureDetector(
                          onTap: () => controller.inputDate(context),
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, right: 10, left: 5),
                            height: 50,
                            width: Get.width * 0.25,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: AppColor.whiteColor),
                            child: Center(
                                child: Text((controller.datePick.value == '')
                                    ? "Tgl. Lahir"
                                    : controller.datePick.value)),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      height: 50,
                      width: Get.width * 0.825,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColor.whiteColor),
                      child:
                          uiComponent().edtField(controller.edt_email, 'Email'),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      height: 50,
                      width: Get.width * 0.825,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColor.whiteColor),
                      child: uiComponent()
                          .edtField(controller.edt_alamat, 'Alamat'),
                    ),
                    GestureDetector(
                      onTap: () => controller.popUpProvinsi(),
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        height: 50,
                        width: Get.width * 0.825,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppColor.whiteColor),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 16, 0, 0),
                          child: Text(
                            (controller.name_provinsi.value == '')
                                ? 'Provinsi'
                                : controller.name_provinsi.value,
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.bodyColor.shade700),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.popUpKota(),
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 5),
                        height: 50,
                        width: Get.width * 0.825,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppColor.whiteColor),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 16, 0, 0),
                          child: Text(
                            (controller.name_kota.value == '')
                                ? 'Kota'
                                : controller.name_kota.value,
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.bodyColor.shade700),
                          ),
                        ),
                      ),
                    ),
                    uiComponent().baseLineDarkColor(context),
                    GestureDetector(
                      onTap: () => controller.ktpSourceSelector(context),
                      child: (controller.ktpPreview != "")
                          ? Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(controller.ktpPreview.value),
                                  width: Get.width * 0.8,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.topCenter,
                              margin: const EdgeInsets.only(top: 20),
                              height: 200,
                              width: Get.width * 0.8,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffffffff)),
                              child: Center(
                                child: Text(
                                  'KTP',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primary.shade300,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      width: Get.width * 0.825,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColor.whiteColor
                      ),
                      child: TextFormField(
                        controller: controller.edt_nik,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          hintText: 'NIK',
                        ),
                        validator: (value) {
                          if (value == null || value.length < 16) {
                            controller.checker = false;
                            return 'Nomor NIK anda salah';
                          } else {
                            controller.checker = true;
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5, left: 35, right: 35, bottom: 20),
                      child: controller.loading.isFalse
                          ? uiComponent().buttonStyle_one(
                              'Update Profile',
                              context,
                              AppColor.primaryColor.shade400, () async {
                                controller.validator();
                              // await controller.uploadImgProfile();
                              // await controller.uploadImgktp();
                              // controller.updateProfile();
                            })
                          : loadingIndicator(context),
                    ),
                  ],
                ),
              )),
        )),
      );
}
