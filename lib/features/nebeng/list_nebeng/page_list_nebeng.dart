import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/controller_list_nebeng.dart';
import 'package:intake_customer/response/nebeng_response.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/currency_formatter.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded_clickable.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:lottie/lottie.dart';

class PageListNebeng extends GetView<ControllerListNebeng> {
  const PageListNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      backgroundColor: AppColor.bgPageColor,
      title: "Nebeng",
      toolbarTitleColor: AppColor.primaryColor,
      toolbarColor: Colors.white,
      center: null,
      padding: EdgeInsets.zero,
      child: controller.obx(
        (state) => RefreshIndicator(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: Insets.sm, horizontal: Insets.sm),
              itemCount: controller.listNebeng.length,
              itemBuilder: (context, index) =>
                  NebengPostingItem(nebengPost: controller.listNebeng[index]),
            ),
            onRefresh: () async => controller.onRefresh()),
        onLoading: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: Center(
            child: Lottie.asset(
              AppLotties.loadingCar,
              width: Get.width * 0.4,
            ),
          ),
        ),
        onEmpty: Container(
          color: Colors.white,
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppLotties.emptyList, height: 250.w),
              Text(
                "Belum ada nebeng yang tersedia",
                style: TextStyles.textLg,
              ),
              verticalSpace(Insets.lg),
              ButtonPrimary(
                onPressed: () => controller.onRefresh(),
                label: "Muat ulang",
                size: 120.w,
                height: 40.h,
                cornerRadius: Corners.sm,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NebengPostingItem extends StatelessWidget {
  const NebengPostingItem({Key? key, required this.nebengPost})
      : super(key: key);

  final NebengResponse nebengPost;

  @override
  Widget build(BuildContext context) {
    return CardRoundedClickable(
      margin: EdgeInsets.only(
        bottom: Insets.med,
      ),
      onTap: () {
        Get.toNamed(
          Routes.orderNebeng,
          arguments: nebengPost.toJson(),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${nebengPost.nebengRider?.vehicleVariant}",
                    style: TextStyles.textSmBold,
                  ),
                  verticalSpace(Insets.xs),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.date_range,
                        size: IconSizes.sm,
                        color: AppColor.neutral.shade300,
                      ),
                      horizontalSpace(Insets.xs),
                      Text(
                        LocaleTime.formatDateLocale(
                          nebengPost.createdAt.toString(),
                        ),
                        style: TextStyles.small1.copyWith(
                          color: AppColor.basic.shade400,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: CurrencyFormat.convertToIdr(
                        nebengPost.price,
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
                  Row(
                    children: [
                      AppIcons.smallIcon(AppIcons.seat, size: Sizes.sm),
                      horizontalSpace(Insets.xs),
                      RichText(
                        text: TextSpan(
                          text: "${nebengPost.count}",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: FontSizes.s14,
                          ),
                          children: [
                            TextSpan(
                              text: "/${nebengPost.seatAvail}",
                              style: TextStyle(
                                color: AppColor.basic.shade400,
                                fontSize: FontSizes.s14,
                              ),
                            ),
                            nebengPost.seatAvail == nebengPost.count
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
                    ],
                  )
                ],
              )
            ],
          ),
          verticalSpace(Insets.med),
          SizedBox(
            // color: Colors.blue,
            height: 75,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        text: LocaleTime.formatDateLocale(
                          nebengPost.dateDep.toString(),
                        ),
                        style:
                            TextStyles.textXs.copyWith(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: "\n${nebengPost.timeDep}",
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        text: LocaleTime.formatDateLocale(
                          nebengPost.dateArr.toString(),
                        ),
                        style:
                            TextStyles.textXs.copyWith(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: "\n${nebengPost.timeArr}",
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
                      size: Sizes.sm,
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
                      size: Sizes.sm,
                    ),
                  ],
                ),
                horizontalSpace(Insets.xs),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${nebengPost.cityOrigin}",
                      style: TextStyles.textXs,
                    ),
                    Text(
                      "${nebengPost.cityDestination}",
                      style: TextStyles.textXs,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
