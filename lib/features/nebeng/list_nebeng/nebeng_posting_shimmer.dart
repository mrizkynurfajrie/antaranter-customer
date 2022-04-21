import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded.dart';
import 'package:shimmer/shimmer.dart';

class NebengPostingShimmer extends StatelessWidget {
  const NebengPostingShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardRounded(
      margin: EdgeInsets.only(
        bottom: Insets.med,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: Sizes.med,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.xs),
                  SizedBox(
                    width: 100.w,
                    height: Sizes.med,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100.w,
                height: Sizes.med,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
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
                    SizedBox(
                      width: 100.w,
                      height: Sizes.med,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: Sizes.med,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          color: AppColor.whiteColor,
                        ),
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
                    SizedBox(
                      width: 100.w,
                      height: Sizes.med,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: Sizes.med,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          color: AppColor.whiteColor,
                        ),
                      ),
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
