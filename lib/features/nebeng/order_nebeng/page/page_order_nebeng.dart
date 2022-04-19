import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/controller_order_nebeng.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/currency_formatter.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';
import 'package:shimmer/shimmer.dart';

class PageOrderNebeng extends GetView<ControllerOrderNebeng> {
  const PageOrderNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      appBar: const CustomAppBar(
        color: Colors.white,
        title: "Detail Nebeng",
        colorTitle: AppColor.primaryColor,
        useLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Insets.med),
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
                  InkWell(
                    onTap: () {
                      if (controller.postinganNebeng.value.mainRider?.image !=
                          null) {
                        showPopUpImage(
                          imageUri: imageUrlPath(controller
                                  .postinganNebeng.value.mainRider?.image ??
                              ''),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: SizedBox(
                        height: IconSizes.xxl,
                        width: IconSizes.xxl,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: imageUrlPath(controller
                                  .postinganNebeng.value.mainRider?.image ??
                              ''),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Shimmer(
                            gradient: AppColor.shimmerGradient,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            height: 50,
                            width: 50,
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
                      ),
                    ),
                  ),
                  horizontalSpace(Insets.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.postinganNebeng.value.mainRider?.name}",
                          style: TextStyles.textStdBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${controller.postinganNebeng.value.mainRider?.cityLocation}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
              padding: EdgeInsets.all(Insets.med),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Kendaraan',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Text(
                                "${controller.postinganNebeng.value.nebengRider?.vehicleVariant}",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Warna Kendaraan',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Text(
                                "${controller.postinganNebeng.value.nebengRider?.vehicleColor}",
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
                        AppIcons.seat,
                        size: IconSizes.med,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Kursi tersedia',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Obx(
                                () => RichText(
                                  text: TextSpan(
                                    text:
                                        "${controller.postinganNebeng.value.count}",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: FontSizes.s14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "/${controller.postinganNebeng.value.seatAvail}",
                                        style: TextStyle(
                                          color: AppColor.basic.shade400,
                                          fontSize: FontSizes.s14,
                                        ),
                                      ),
                                      controller.postinganNebeng.value
                                                  .seatAvail ==
                                              controller
                                                  .postinganNebeng.value.count
                                          ? TextSpan(
                                              text: " (penuh)",
                                              style: TextStyle(
                                                color: AppColor.errorColor,
                                                fontSize: FontSizes.s14,
                                              ),
                                            )
                                          : const TextSpan(),
                                    ],
                                  ),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Harga',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: CurrencyFormat.convertToIdr(
                                    controller.postinganNebeng.value.price,
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
              padding: EdgeInsets.all(Insets.med),
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
                            controller.postinganNebeng.value.dateDep.toString(),
                          ),
                          style:
                              TextStyles.textSm.copyWith(color: Colors.black54),
                          children: [
                            TextSpan(
                              text:
                                  "\n${controller.postinganNebeng.value.timeDep}",
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          text: LocaleTime.formatDateLocale(
                            controller.postinganNebeng.value.dateArr.toString(),
                          ),
                          style:
                              TextStyles.textSm.copyWith(color: Colors.black54),
                          children: [
                            TextSpan(
                              text:
                                  "\n${controller.postinganNebeng.value.timeArr}",
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
                        "${controller.postinganNebeng.value.cityOrigin}",
                        style: TextStyles.textSm,
                      ),
                      Text(
                        "${controller.postinganNebeng.value.cityDestination}",
                        style: TextStyles.textSm,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(Insets.xl),
            ButtonPrimary(
              margin: EdgeInsets.symmetric(horizontal: Insets.med),
              cornerRadius: 15,
              color: AppColor.primaryColor,
              size: Get.width,
              label: "Pesan sekarang",
              height: Sizes.xl,
              enable: controller.postinganNebeng.value.count !=
                  controller.postinganNebeng.value.seatAvail,
              onPressed: () {
                showPopUpChoice(
                  imageUri: AppIcons.confirmData,
                  imageSize: 120.w,
                  labelPositif: "Pesan",
                  onConfirm: () {
                    Get.back();
                    controller.orderNebeng();
                  },
                  title: "Konfirmasi pesanan",
                  description:
                      "Mohon pastikan pesanan anda sudah benar, anda tidak dapat melakukan pembatalan pesanan jika pesanan telah dilakukan",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
