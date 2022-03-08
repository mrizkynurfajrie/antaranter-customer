import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/pages/page_decoration_top.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded.dart';
import 'package:intake_customer/shared/widgets/input_format/input_format_money.dart';
import 'package:intake_customer/shared/widgets/inputs/input_icon_underline.dart';

class PageCreateOrder extends StatelessWidget {
  const PageCreateOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      center: AppLogos.logoAppBar(AppLogos.logoColored),
      title: "IN-TAKE",
      enableBack: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(Insets.med),
            CardRounded(
              margin: EdgeInsets.symmetric(horizontal: Insets.lg),
              width: Get.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: IconSizes.lg,
                        height: IconSizes.lg,
                        child: Image.asset(AppIcons.locationTake),
                      ),
                      horizontalSpace(Insets.med),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.xs,
                              ),
                              width: IconSizes.lg,
                              height: IconSizes.lg,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Lokasi pengambilan barang",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.textStdBold.copyWith(
                                    fontSize: FontSizes.s14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(Insets.xs),
                  Container(
                    height: Strokes.med,
                    width: Get.width,
                    color: AppColor.bgPageColor,
                    margin: EdgeInsets.only(left: (IconSizes.lg + Insets.med)),
                  ),
                  verticalSpace(Insets.xs),
                  Row(
                    children: [
                      SizedBox(
                        width: IconSizes.lg,
                        height: IconSizes.lg,
                        child: Image.asset(AppIcons.locationIn),
                      ),
                      horizontalSpace(Insets.med),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Insets.xs,
                              ),
                              width: IconSizes.lg,
                              height: IconSizes.lg,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Lokasi pengantaran barang",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.textStdBold.copyWith(
                                    fontSize: FontSizes.s14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(Insets.med),
            CardRounded(
              margin: EdgeInsets.symmetric(horizontal: Insets.lg),
              width: Get.width,
              padding: EdgeInsets.all(Insets.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Penerima",
                      style: TextStyles.textStdBold.copyWith(
                        fontSize: FontSizes.s16,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.med),
                  InputIconUnderline(
                    keyboardType: TextInputType.name,
                    hintText: "Nama Penerima",
                    icon: Icon(
                      Icons.person,
                      size: IconSizes.lg,
                      color: AppColor.primaryColor,
                    ),
                    isDense: true,
                    onChange: (String) {},
                  ),
                  verticalSpace(Insets.med),
                  InputIconUnderline(
                    inputFormatters: [LengthLimitingTextInputFormatter(13)],
                    keyboardType: TextInputType.number,
                    hintText: "No Handphone",
                    icon: Text(
                      "+62",
                      style: TextStyles.textStdBold.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    isDense: true,
                    onChange: (String) {},
                  ),
                  verticalSpace(Insets.med),
                  InputIconUnderline(
                    keyboardType: TextInputType.name,
                    hintText: "Nama barang",
                    icon: Icon(
                      Icons.inventory,
                      size: IconSizes.lg,
                      color: AppColor.primaryColor,
                    ),
                    isDense: true,
                    onChange: (String) {},
                  ),
                  verticalSpace(Insets.med),
                  InputIconUnderline(
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    hintText: "Deskripsi barang",
                    icon: Text(
                      "Desc",
                      style: TextStyles.textStdBold.copyWith(
                        color: AppColor.primaryColor,
                        fontSize: FontSizes.s14,
                      ),
                    ),
                    isDense: true,
                    onChange: (String) {},
                  ),
                ],
              ),
            ),
            verticalSpace(Insets.med),
            CardRounded(
              margin: EdgeInsets.symmetric(horizontal: Insets.lg),
              width: Get.width,
              padding: EdgeInsets.all(Insets.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Biaya",
                      style: TextStyles.textStdBold.copyWith(
                        fontSize: FontSizes.s16,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.med),
                  InputIconUnderline(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ThousandsSeparatorInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    hintText: "Ongkir",
                    icon: Text(
                      "Rp.",
                      style: TextStyles.textStdBold.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    isDense: true,
                    onChange: (String) {},
                  ),
                  verticalSpace(Insets.med),
                  InputIconUnderline(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ThousandsSeparatorInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    hintText: "Talangan",
                    icon: Text(
                      "Rp.",
                      style: TextStyles.textStdBold.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    isDense: true,
                    onChange: (String) {},
                  ),
                ],
              ),
            ),
            verticalSpace(Insets.lg),
            ButtonPrimary(
              margin: EdgeInsets.symmetric(horizontal: Insets.med),
              cornerRadius: 15,
              color: AppColor.primaryColor,
              size: Get.width,
              label: "Pesan",
              onPressed: () {},
            ),
            verticalSpace(Insets.lg),
          ],
        ),
      ),
    );
  }
}
