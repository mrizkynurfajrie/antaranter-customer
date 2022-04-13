import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/controller_detail_nebeng.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
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
                        shadow: [],
                        child: Icon(
                          Icons.schedule,
                          size: IconSizes.lg,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: AppColor.primaryColor,
                        iconStyle: IconStyle(
                          color: Colors.white,
                          iconData: Icons.check,
                        ),
                      ),
                      afterLineStyle: LineStyle(
                        color: AppColor.neutral.shade200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.end,
                      startChild: CardRounded(
                        shadow: [],
                        child: Icon(
                          CupertinoIcons.car_detailed,
                          size: IconSizes.lg,
                          color: AppColor.neutral.shade300,
                        ),
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: AppColor.neutral.shade300,
                        iconStyle: IconStyle(
                          color: Colors.white,
                          iconData: Icons.check,
                        ),
                      ),
                      afterLineStyle: LineStyle(
                        color: AppColor.neutral.shade200,
                      ),
                      beforeLineStyle: LineStyle(
                        color: AppColor.neutral.shade200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.end,
                      isLast: true,
                      startChild: CardRounded(
                        shadow: [],
                        child: Icon(
                          CupertinoIcons.home,
                          size: IconSizes.lg,
                          color: AppColor.neutral.shade300,
                        ),
                      ),
                      beforeLineStyle: LineStyle(
                        color: AppColor.neutral.shade200,
                      ),
                      indicatorStyle: IndicatorStyle(
                        color: AppColor.neutral.shade300,
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
                  shadow: [],
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Driver - Sabtu november 2012"),
                      ),
                      Text("18:49"),
                    ],
                  ),
                ),
                indicatorStyle: IndicatorStyle(width: Sizes.sm),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: TimelineTile(
                alignment: TimelineAlign.start,
                endChild: CardRounded(
                  shadow: [],
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Driver - Sabtu november 2012"),
                      ),
                      Text("18:49"),
                    ],
                  ),
                ),
                indicatorStyle: IndicatorStyle(width: Sizes.sm),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: TimelineTile(
                alignment: TimelineAlign.start,
                isLast: true,
                endChild: CardRounded(
                  shadow: [],
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Driver - Sabtu november 2012"),
                      ),
                      Text("18:49"),
                    ],
                  ),
                ),
                indicatorStyle: IndicatorStyle(width: Sizes.sm),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
