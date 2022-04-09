import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/controller_detail_nebeng.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/currency_formatter.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class PageDetailNebeng extends GetView<ControllerDetailNebeng> {
  const PageDetailNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 2,
      center: null,
      title: "Detail Nebeng",
      toolbarTitleColor: AppColor.primaryColor,
      enableBack: false,
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          // TODO add init call api for home
          await controller.getDataOrder();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: controller.obx(
            ((state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.med,
                        vertical: Insets.sm,
                      ),
                      child: Text(
                        "Driver",
                        style: TextStyles.textStd,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(Insets.med),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: SizedBox(
                              height: IconSizes.xxl,
                              width: IconSizes.xxl,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: imageUrlPath(controller
                                        .controllerUserInfo.user.value.image ??
                                    ''),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Shimmer(
                                  gradient: AppColor.shimmerGradient,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    SvgPicture.asset(
                                  AppIcons.dummyAvatar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(Insets.lg),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.orderResponse.value.mainRider?.name}",
                                  style: TextStyles.textStdBold,
                                ),
                                Text(
                                  "${controller.orderResponse.value.mainRider?.phone}",
                                  style: TextStyle(
                                    color: AppColor.neutral.shade400,
                                  ),
                                ),
                                Text(
                                  "${controller.orderResponse.value.mainRider?.cityLocation}",
                                  style: TextStyle(
                                    color: AppColor.neutral.shade400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.med,
                        vertical: Insets.sm,
                      ),
                      child: Text(
                        "Kendaraan",
                        style: TextStyles.textStd,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(Insets.med),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AppIcons.smallIcon(
                                AppIcons.minivan,
                                size: IconSizes.med,
                              ),
                              horizontalSpace(10.w),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Kendaraan',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 145, 145, 145),
                                        ),
                                      ),
                                      Text(
                                        "${controller.orderResponse.value.nebengRider?.vehicleVariant}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppIcons.smallIcon(
                                AppIcons.colour,
                                size: IconSizes.med,
                              ),
                              horizontalSpace(10.w),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Warna Kendaraan',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 145, 145, 145),
                                        ),
                                      ),
                                      Text(
                                        "${controller.orderResponse.value.nebengRider?.vehicleColor}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppIcons.smallIcon(
                                AppIcons.licencePlate,
                                size: IconSizes.med,
                              ),
                              horizontalSpace(10.w),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Plat Kendaraan',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 145, 145, 145),
                                        ),
                                      ),
                                      Text(
                                        "${controller.orderResponse.value.nebengRider?.platNumber}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppIcons.smallIcon(
                                AppIcons.priceTag,
                                size: IconSizes.med,
                              ),
                              horizontalSpace(10.w),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Harga',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromARGB(
                                              255, 145, 145, 145),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: CurrencyFormat.convertToIdr(
                                            controller.orderResponse.value
                                                .nebengPost?.price,
                                            0,
                                          ),
                                          style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: FontSizes.s14,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "/kursi",
                                              style: TextStyles.small1.copyWith(
                                                color: AppColor.basic.shade400,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.med,
                        vertical: Insets.sm,
                      ),
                      child: Text(
                        "Rute & Jadwal",
                        style: TextStyles.textStd,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Insets.med),
                      height: 125,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(
                                  text: LocaleTime.formatDateLocale(
                                    controller.orderResponse.value.nebengPost
                                            ?.dateDep
                                            .toString() ??
                                        '',
                                  ),
                                  style: TextStyles.textSm
                                      .copyWith(color: Colors.black54),
                                  children: [
                                    TextSpan(
                                      text:
                                          "\n${controller.orderResponse.value.nebengPost?.timeDep}",
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(
                                  text: LocaleTime.formatDateLocale(
                                    controller.orderResponse.value.nebengPost
                                            ?.dateArr
                                            .toString() ??
                                        '',
                                  ),
                                  style: TextStyles.textSm
                                      .copyWith(color: Colors.black54),
                                  children: [
                                    TextSpan(
                                      text:
                                          "\n${controller.orderResponse.value.nebengPost?.timeArr}",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          horizontalSpace(Insets.xs),
                          Column(
                            children: [
                              AppIcons.smallIcon(
                                AppIcons.locationStart,
                                size: Sizes.med,
                              ),
                              Expanded(
                                child: VerticalDivider(
                                  color: AppColor.neutral.shade300,
                                  thickness: 1,
                                  width: 20,
                                ),
                              ),
                              AppIcons.smallIcon(
                                AppIcons.locationIn,
                                size: Sizes.med,
                              ),
                            ],
                          ),
                          horizontalSpace(Insets.xs),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.orderResponse.value.nebengPost?.cityOrigin}",
                                style: TextStyles.textSm,
                              ),
                              Text(
                                "${controller.orderResponse.value.nebengPost?.cityDestination}",
                                style: TextStyles.textSm,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Insets.med),
                      margin: EdgeInsets.only(
                          top: Insets.sm, bottom: (Insets.xs - 3)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Pesanan",
                                style: TextStyles.textSm,
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                  controller
                                      .orderResponse.value.nebengPost?.price,
                                  0,
                                ),
                                style: TextStyles.textSm,
                              ),
                            ],
                          ),
                          verticalSpace(Insets.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Waktu pemesanan",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.neutral.shade500,
                                ),
                              ),
                              Text(
                                LocaleTime.formatDateTimeLocale(
                                  controller.orderResponse.value.nebengOrder
                                          ?.createdAt
                                          .toString() ??
                                      '',
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.neutral.shade500,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(Insets.sm),
                          controller.orderResponse.value.nebengOrder?.status ==
                                  2
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Waktu keberangkatan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColor.neutral.shade500,
                                      ),
                                    ),
                                    Text(
                                      LocaleTime.formatDateTimeLocale(
                                        controller.orderResponse.value
                                                .nebengPost?.datetimeStart
                                                .toString() ??
                                            '',
                                      ),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColor.neutral.shade500,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Insets.med,
                      ),
                      width: Get.width,
                      color: Colors.white,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          controller.openwhatsapp();
                        },
                        icon: AppIcons.smallIcon(AppIcons.whatsapp),
                        label: Text(
                          "Hubungi Driver",
                          style: TextStyles.textSm.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: AppColor.primaryColor,
                          side: const BorderSide(
                            color: AppColor.successColor,
                          ),
                        ),
                      ),
                    ),
                    controller.orderResponse.value.nebengOrder?.status == 2
                        ? Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Insets.med,
                            ),
                            width: Get.width,
                            color: Colors.white,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                controller.callEmergency();
                              },
                              icon: const Icon(Icons.call),
                              label: Text(
                                "Hubungi Kontak Darurat",
                                style: TextStyles.textSm.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: AppColor.primaryColor,
                                side: const BorderSide(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    controller.orderResponse.value.nebengPost?.statusUpdate ==
                                1 &&
                            controller.orderResponse.value.nebengPost?.status ==
                                1
                        ? Container(
                            padding: EdgeInsets.all(Insets.med),
                            width: Get.width,
                            child: controller.loadingCancel.isFalse
                                ? OutlinedButton(
                                    onPressed: () {
                                      controller.cancelOrderNebeng();
                                    },
                                    child: Text(
                                      "Batalkan pesanan",
                                      style: TextStyles.textSm.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      primary: AppColor.errorColor,
                                    ),
                                  )
                                : loadingIndicator(context),
                          )
                        : const SizedBox(),
                  ],
                )),
            onLoading: SizedBox(
              height: Get.height - 100.h,
              width: Get.width,
              child: const Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              ),
            ),
            onEmpty: SizedBox(
              height: Get.height - 100.h,
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
            ),
            onError: (e) => SizedBox(
              height: Get.height - 100.h,
              width: Get.width,
              child: const Center(
                child: Text("Terjadi kesalahan"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
