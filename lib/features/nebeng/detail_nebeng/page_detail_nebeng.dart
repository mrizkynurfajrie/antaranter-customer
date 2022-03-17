import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';
import 'package:intake_customer/shared/widgets/buttons/button_icon_horizontal.dart';
import 'package:shimmer/shimmer.dart';

class PageDetailNebeng extends StatelessWidget {
  const PageDetailNebeng({Key? key}) : super(key: key);

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
                        imageUrl: "https://via.placeholder.com/150",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Shimmer(
                          gradient: AppColor.shimmerGradient,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/fajrie.jpg",
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
                          "Dedy fuady",
                          style: TextStyles.textStdBold,
                        ),
                        Text(
                          "081256548987",
                          style: TextStyle(
                            color: AppColor.neutral.shade400,
                          ),
                        ),
                        Text(
                          "Samarinda",
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
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Kendaraan',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Text(
                                "Toyota Innova Luxury",
                                style: TextStyle(
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
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Plat Kendaraan',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Text(
                                "KT 6488 CB",
                                style: TextStyle(
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
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Harga',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
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
                          text: "25 oktober 2022",
                          style:
                              TextStyles.textSm.copyWith(color: Colors.black54),
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
                          style:
                              TextStyles.textSm.copyWith(color: Colors.black54),
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
                    children: [
                      Text(
                        "Samarinda",
                        style: TextStyles.textSm,
                      ),
                      Text(
                        "Balikpapan",
                        style: TextStyles.textSm,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Insets.med),
              margin: EdgeInsets.only(top: Insets.sm, bottom: (Insets.xs - 3)),
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
                        "Rp 70.000",
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
                        "15-03-2022 10:30",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.neutral.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Insets.med),
              width: Get.width,
              color: Colors.white,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: AppIcons.smallIcon(AppIcons.whatsapp),
                label: Text(
                  "Hubungi Driver",
                  style: TextStyles.textSm.copyWith(
                    color: Colors.black,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  primary: AppColor.primaryColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Insets.med),
              width: Get.width,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Batalkan pesanan",
                  style: TextStyles.textSm.copyWith(
                    color: Colors.black,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  primary: AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
