import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/controller_home.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/pages/page_decoration_top.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/buttons/button_text.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded_bottom.dart';

class PageHome extends GetView<ControllerHome> {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      center: AppLogos.logoAppBar(AppLogos.logoColored),
      title: "IN-TAKE",
      enableBack: false,
      child: CustomScrollView(
        slivers: [
          //header
          SliverToBoxAdapter(
            child: CardRoundedBottom(
              margin: EdgeInsets.zero,
              color: AppColor.primaryColor.shade400,
              borderRadius: 30,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.username.value,
                                style: TextStyles.textTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                controller.phone.value,
                                style: TextStyles.inter.copyWith(
                                  color: AppColor.whiteColor,
                                  fontSize: FontSizes.s12,
                                ),
                              )
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/fajrie.jpg"),
                        )
                      ],
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            ),
          ),
          //opsi kirim dan cek pengiriman
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(Get.height * 0.03),
                Text(
                  "Layanan apa yang anda butuhkan ?",
                  style: TextStyles.textTableOrange,
                ),
                verticalSpace(Get.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Insets.med),
                  child: Row(
                    children: [
                      MenuButtonHome(
                        title: "Kirim Barang",
                        subTitle: "Kirim barang sesuai keinginan anda",
                        icon: Image.asset(
                          AppIcons.kurirIcon,
                          fit: BoxFit.contain,
                        ),
                        ontap: () {
                          Get.toNamed(Routes.create_order);
                        },
                      ),
                      horizontalSpace(Get.width * 0.025),
                      MenuButtonHome(
                        title: "Nebeng",
                        subTitle: "Yuk nebeng bersama kami",
                        icon: Image.asset(
                          AppIcons.nebengIcon,
                          fit: BoxFit.contain,
                        ),
                        ontap: () {
                          Get.toNamed(Routes.listNebeng);
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(Get.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Insets.med),
                  child: Row(
                    children: [
                      MenuButtonHome(
                        title: "Titip",
                        subTitle: "Titipkan barang anda bersama kami",
                        icon: Image.asset(
                          AppIcons.titipIcon,
                          fit: BoxFit.contain,
                        ),
                        ontap: () {},
                      ),
                      horizontalSpace(Get.width * 0.025),
                      MenuButtonHome(
                        title: "Riwayat Pengiriman",
                        subTitle: "Lihat riwayat pesanan anda",
                        icon: Image.asset(
                          AppIcons.historyIcon,
                          fit: BoxFit.contain,
                        ),
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
                verticalSpace(Get.height * 0.03),
              ],
            ),
          ),
          //list iklan
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.med),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Penawaran untuk anda",
                        style: TextStyle(
                          fontSize: FontSizes.s14,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      ButtonText(
                        onPressed: () {},
                        label: "Lihat semua",
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 20, bottom: Insets.xs),
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.whiteColor,
                              boxShadow: Shadows.universal),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 110,
                                    width: Get.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        "assets/images/demo-pict.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  verticalSpace(10),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Insets.med,
                                    ),
                                    child: Text(
                                      "Potongan 50% Antar Paket",
                                      style: TextStyles.h6,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  verticalSpace(6),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Insets.med,
                                    ),
                                    child: Text(
                                      "Dapatkan potongan harga hingga 50% untuk pengiriman paket di Samarinda",
                                      style: TextStyle(fontSize: FontSizes.s11),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
          //konten bantuan user
          SliverToBoxAdapter(
            child: CardRounded(
              margin: EdgeInsets.symmetric(
                horizontal: Insets.med,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Image.asset(
                      AppIcons.customerService,
                      fit: BoxFit.contain,
                    ),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Perlu Bantuan ?",
                          textAlign: TextAlign.start,
                          style: TextStyles.h6,
                        ),
                        Text(
                          "Hubungi Customer Service",
                          style: TextStyle(
                              color: AppColor.bodyColor.shade600,
                              fontSize: FontSizes.s11),
                        )
                      ],
                    ),
                  ),
                  ButtonPrimary(
                    cornerRadius: 15,
                    color: AppColor.primaryColor,
                    size: Get.width * 0.25,
                    height: Sizes.lg,
                    label: "Hubungi",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          //jarak dasar
          SliverToBoxAdapter(
            child: verticalSpace(20),
          )
        ],
      ),
    );
  }
}

class MenuButtonHome extends StatelessWidget {
  final Function() ontap;
  final Widget icon;
  final String title;
  final String subTitle;

  const MenuButtonHome({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: CardRounded(
          shadow: Shadows.universal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(65),
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: 65,
                  height: 65,
                  color: AppColor.bodyColor.shade200,
                  child: icon,
                ),
              ),
              verticalSpace(15),
              Text(
                title,
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(10),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.bodyColor.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
