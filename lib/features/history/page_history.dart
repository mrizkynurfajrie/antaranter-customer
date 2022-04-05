import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/history/controller_history.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class PageHistory extends GetView<ControllerHistory> {
  const PageHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.bgPageColor,
        appBar: AppBar(
          title: const Text(
            'Riwayat Pesanan',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          foregroundColor: AppColor.primaryColor.shade300,
          backgroundColor: AppColor.whiteColor,
        ),
        body: Obx(() => controller.allData.value.length != 0
            ? ListView.builder(
                controller: controller.loadController,
                itemCount: controller.allData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          child: Icon(
                            CupertinoIcons.gobackward,
                            color: AppColor.primaryColor.shade600,
                            size: 35,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                '${controller.allData[index].post?.cityOrigin} - ${controller.allData[index].post?.cityDestination}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                DateFormat('dd-MM-yyyy').format(
                                    controller.allData[index].createdAt!),
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 5, bottom: 5),
                              child: Text(
                                controller.allData[index].status == 4
                                    ? 'Batalkan'
                                    : 'Selesai',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.red),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                })
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(AppLotties.empty),
                    verticalSpace(Insets.med),
                    Text(
                      "Anda belum pernah melakukan pemesanan",
                      style: TextStyles.textStdBold,
                    )
                  ],
                ),
              )),
      );
}
