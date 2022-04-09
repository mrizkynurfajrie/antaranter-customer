import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/history/controller_history.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class PageHistory extends GetView<ControllerHistory> {
  const PageHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PageDecorationTop(
        padding: EdgeInsets.zero,
        backgroundColor: AppColor.bgPageColor,
        toolbarColor: AppColor.whiteColor,
        toolbarElevation: 2,
        center: null,
        title: "Riwayat Pesanan",
        toolbarTitleColor: AppColor.primaryColor,
        enableBack: true,
        child: RefreshIndicator(
          onRefresh: () async => controller.onRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Obx(
              () => controller.loading.isFalse
                  ? controller.allData.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          controller: controller.loadController,
                          itemCount: controller.allData.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 4,
                              color: AppColor.whiteColor,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, top: 20, bottom: 20),
                                    child: Icon(
                                      CupertinoIcons.gobackward,
                                      color: AppColor.primaryColor.shade600,
                                      size: 35,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: SizedBox(
                                          width: Get.width * 0.77,
                                          child: Text(
                                            '${controller.allData[index].post?.cityOrigin} - ${controller.allData[index].post?.cityDestination}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: Text(
                                          DateFormat('dd-MM-yyyy').format(
                                              controller
                                                  .allData[index].createdAt!),
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, top: 5, bottom: 5),
                                        child: Text(
                                          controller.allData[index].status == 4
                                              ? 'Batalkan'
                                              : 'Selesai',
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          })
                      : SizedBox(
                          height: Get.height - 85.h,
                          width: Get.width,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LottieBuilder.asset(AppLotties.empty),
                                verticalSpace(Insets.med),
                                Text(
                                  "Belum ada pesanan",
                                  style: TextStyles.textStdBold,
                                )
                              ],
                            ),
                          ),
                        )
                  : SizedBox(
                      height: Get.height - 85.h,
                      width: Get.width,
                      child: Center(
                        child: loadingIndicator(context),
                      ),
                    ),
            ),
          ),
        ),
      );
}
