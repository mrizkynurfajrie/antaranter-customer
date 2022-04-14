import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/controller_detail_nebeng.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PageStatusNebeng extends GetView<ControllerDetailNebeng> {
  const PageStatusNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.whiteColor,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 1,
      center: null,
      title: "Status pemesanan",
      toolbarTitleColor: AppColor.primaryColor,
      enableBack: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
              child: Row(
                children: [
                  Expanded(
                    child: TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.end,
                      isFirst: true,
                      startChild: CardRounded(
                        shadow: const [],
                        child: Icon(
                          Icons.schedule,
                          size: IconSizes.lg,
                          color: controller.isOnScheduleActive()
                              ? AppColor.primaryColor
                              : AppColor.neutral.shade300,
                        ),
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: controller.isOnScheduleActive()
                            ? AppColor.primaryColor
                            : AppColor.neutral.shade300,
                        iconStyle: IconStyle(
                          color: Colors.white,
                          iconData: Icons.check,
                        ),
                      ),
                      afterLineStyle: LineStyle(
                        color: controller.isOnTheWayActive()
                            ? AppColor.primaryColor
                            : AppColor.neutral.shade200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.end,
                      startChild: CardRounded(
                        shadow: const [],
                        child: Icon(
                          CupertinoIcons.car_detailed,
                          size: IconSizes.lg,
                          color: controller.isOnTheWayActive()
                              ? AppColor.primaryColor
                              : AppColor.neutral.shade300,
                        ),
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: controller.isOnTheWayActive()
                            ? AppColor.primaryColor
                            : AppColor.neutral.shade300,
                        iconStyle: IconStyle(
                          color: Colors.white,
                          iconData: Icons.check,
                        ),
                      ),
                      afterLineStyle: LineStyle(
                        color: controller.isOnFinishActive()
                            ? AppColor.primaryColor
                            : AppColor.neutral.shade200,
                      ),
                      beforeLineStyle: LineStyle(
                        color: controller.isOnTheWayActive()
                            ? AppColor.primaryColor
                            : AppColor.neutral.shade200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.end,
                      isLast: true,
                      startChild: CardRounded(
                        shadow: const [],
                        child: Icon(
                          CupertinoIcons.home,
                          size: IconSizes.lg,
                          color: controller.isOnFinishActive()
                              ? AppColor.primaryColor
                              : AppColor.neutral.shade300,
                        ),
                      ),
                      beforeLineStyle: LineStyle(
                        color: controller.isOnFinishActive()
                            ? AppColor.primaryColor
                            : AppColor.neutral.shade200,
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: controller.isOnFinishActive()
                            ? AppColor.primaryColor
                            : AppColor.neutral.shade300,
                        iconStyle: IconStyle(
                          color: Colors.white,
                          iconData: Icons.check,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(Insets.sm),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(Insets.med),
                child: Text(
                  controller.statusOrderNebeng(),
                  style: TextStyles.textPrimaryColor.copyWith(
                    fontSize: FontSizes.s14,
                  ),
                ),
              ),
            ),
            verticalSpace(Insets.sm),
            Padding(
              padding: EdgeInsets.all(Insets.med),
              child: Text(
                "Status Pemesanan",
                style: TextStyles.textBaseBold,
              ),
            ),
            Divider(
              color: AppColor.neutral.shade700,
            ),
            verticalSpace(Insets.sm),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: TimelineTile(
                alignment: TimelineAlign.start,
                isFirst: true,
                endChild: CardRounded(
                  shadow: const [],
                  child: controller.isOnFinishActive()
                      ? Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Driver - ${LocaleTime.formatDateLocaleWithDay(controller.orderResponse.value.nebengPost?.datetimeFinish.toString() ?? '')}"),
                            ),
                            Text(
                              LocaleTime.formatDateToTimeOnly(controller
                                      .orderResponse
                                      .value
                                      .nebengPost
                                      ?.datetimeFinish
                                      .toString() ??
                                  ''),
                            ),
                          ],
                        )
                      : const Text("-"),
                ),
                indicatorStyle: IndicatorStyle(
                  width: Sizes.sm,
                  color: controller.isOnFinishActive()
                      ? AppColor.primaryColor
                      : AppColor.neutral.shade300,
                ),
                afterLineStyle: LineStyle(
                  color: controller.isOnFinishActive()
                      ? AppColor.primaryColor
                      : AppColor.neutral.shade200,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: TimelineTile(
                alignment: TimelineAlign.start,
                endChild: CardRounded(
                  shadow: const [],
                  child: controller.isOnTheWayActive()
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Driver - ${LocaleTime.formatDateLocaleWithDay(controller.orderResponse.value.nebengPost?.datetimeStart.toString() ?? '')}",
                                    style: TextStyles.subtitle3,
                                  ),
                                ),
                                Text(
                                  LocaleTime.formatDateToTimeOnly(controller
                                          .orderResponse
                                          .value
                                          .nebengPost
                                          ?.datetimeStart
                                          .toString() ??
                                      ''),
                                  style: TextStyles.subtitle3,
                                ),
                              ],
                            ),
                            verticalSpace(Insets.xs),
                            Text(
                              "Driver memulai perjalanan nebeng",
                              style: TextStyles.subtitle3.copyWith(
                                color: AppColor.neutral.shade500,
                              ),
                            ),
                          ],
                        )
                      : const Text("-"),
                ),
                indicatorStyle: IndicatorStyle(
                  width: Sizes.sm,
                  color: controller.isOnTheWayActive()
                      ? AppColor.primaryColor
                      : AppColor.neutral.shade300,
                ),
                afterLineStyle: LineStyle(
                  color: controller.isOnTheWayActive()
                      ? AppColor.primaryColor
                      : AppColor.neutral.shade200,
                ),
                beforeLineStyle: LineStyle(
                  color: controller.isOnFinishActive()
                      ? AppColor.primaryColor
                      : AppColor.neutral.shade200,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: TimelineTile(
                alignment: TimelineAlign.start,
                isLast: true,
                endChild: CardRounded(
                  shadow: const [],
                  child: controller.isOnScheduleActive()
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Driver - ${LocaleTime.formatDateLocaleWithDay(controller.orderResponse.value.nebengOrder?.createdAt.toString() ?? '')}",
                                    style: TextStyles.subtitle3,
                                  ),
                                ),
                                Text(
                                  LocaleTime.formatDateToTimeOnly(
                                    controller.orderResponse.value.nebengOrder
                                            ?.createdAt
                                            .toString() ??
                                        '',
                                  ),
                                  style: TextStyles.subtitle3,
                                ),
                              ],
                            ),
                            verticalSpace(Insets.xs),
                            Text(
                              "Driver telah menjadwalkan waktu perjalanan",
                              style: TextStyles.subtitle3.copyWith(
                                color: AppColor.neutral.shade500,
                              ),
                            ),
                          ],
                        )
                      : const Text("-"),
                ),
                indicatorStyle: IndicatorStyle(
                  width: Sizes.sm,
                  color: controller.isOnScheduleActive()
                      ? AppColor.primaryColor
                      : AppColor.neutral.shade300,
                ),
                beforeLineStyle: LineStyle(
                  color: controller.isOnTheWayActive()
                      ? AppColor.primaryColor
                      : AppColor.neutral.shade200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
