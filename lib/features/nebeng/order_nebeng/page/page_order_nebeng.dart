import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/controller_order_nebeng.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/currency_formatter.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';

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
                                "${controller.postinganNebeng.value.nebengRider?.vehicleVariant}",
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
                        AppIcons.colour,
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
                                'Warna Kendaraan',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Text(
                                "${controller.postinganNebeng.value.nebengRider?.vehicleColor}",
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
                        AppIcons.seat,
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
                              const Text(
                                'Kursi tersedia',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 145, 145, 145),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${controller.postinganNebeng.value.seatAvail}",
                                  style: TextStyle(
                                    fontSize: FontSizes.s16,
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
              onPressed: () {
                controller.orderNebeng();
              },
            ),
          ],
        ),
      ),
    );
  }
}
