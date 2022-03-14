import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/controller_list_nebeng.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded_clickable.dart';

class PageListNebeng extends GetView<ControllerListNebeng> {
  const PageListNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      appBar: const CustomAppBar(
        color: Colors.white,
        title: "Nebeng",
        colorTitle: AppColor.primaryColor,
      ),
      body: ListView.builder(
        padding:
            EdgeInsets.symmetric(vertical: Insets.sm, horizontal: Insets.sm),
        itemCount: 50,
        itemBuilder: (context, index) => CardRoundedClickable(
          margin: EdgeInsets.only(
            bottom: Insets.med,
          ),
          onTap: () {
            Get.toNamed(Routes.orderNebeng);
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
                        "Kijang inova",
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
                            "20 januari 2020",
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
                          text: "Rp. ",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: FontSizes.s14,
                          ),
                          children: [
                            TextSpan(text: "70.000"),
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
                              text: "5",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: FontSizes.s12,
                              ),
                              children: [
                                TextSpan(
                                  text: " kursi tersedia",
                                  style: TextStyles.small1.copyWith(
                                    color: AppColor.basic.shade400,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
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
                            text: "25 oktober 2022",
                            style: TextStyles.textXs
                                .copyWith(color: Colors.black54),
                            children: [
                              TextSpan(
                                text: "\n09:00",
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                            text: "25 oktober 2022",
                            style: TextStyles.textXs
                                .copyWith(color: Colors.black54),
                            children: [
                              TextSpan(
                                text: "\n10:00",
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
                      children: [
                        Text(
                          "Samarinda",
                          style: TextStyles.textXs,
                        ),
                        Text(
                          "Balikpapan",
                          style: TextStyles.textXs,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
