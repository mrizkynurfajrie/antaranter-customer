import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/controller_home.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/buttons/button_text.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded_clickable.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:shimmer/shimmer.dart';

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
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          // TODO add init call api for home
          await Future.delayed(const Duration(seconds: 3));
        },
        child: CustomScrollView(
          slivers: [
            //header
            SliverToBoxAdapter(
              child: CardRounded(
                margin: EdgeInsets.symmetric(
                  horizontal: Insets.med,
                  vertical: Insets.sm,
                ),
                color: AppColor.primaryColor,
                borderRadius: 15,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: TextStyles.textLg,
                                text: "Hi, ",
                                children: [
                                  TextSpan(
                                      text: controller.controllerUserInfo.user
                                              .value.username ??
                                          "Pelanggan")
                                ],
                              ),
                            ),
                            Text(
                              controller.controllerUserInfo.user.value.phone ??
                                  "08xxx",
                              style: TextStyles.inter.copyWith(
                                color: AppColor.whiteColor,
                                fontSize: FontSizes.s12,
                              ),
                            )
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: SizedBox(
                          height: IconSizes.xxl,
                          width: IconSizes.xxl,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: imageUrlPath(controller
                                    .controllerUserInfo.user.value.image ??
                                ''),
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
                    ],
                  ),
                ),
              ),
            ),
            // user status profile
            SliverToBoxAdapter(
              child: Obx(
                () => controller.controllerUserInfo.user.value.status != 2
                    ? CardRounded(
                        margin: EdgeInsets.symmetric(
                          horizontal: Insets.med,
                          vertical: Insets.xs,
                        ),
                        color: AppColor.whiteColor,
                        borderRadius: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppIcons.smallIcon(
                              AppIcons.profileComp,
                              size: IconSizes.lg,
                            ),
                            horizontalSpace(Insets.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.controllerUserInfo.user.value
                                                .status ==
                                            0
                                        ? "Lengkapi data diri anda untuk mulai menggunakan layanan kami"
                                        : "Admin sedang memverifikasi data anda mohon tunggu 1x24 jam",
                                    style: TextStyles.inter.copyWith(
                                      color: AppColor.neutral,
                                      fontSize: FontSizes.s14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            horizontalSpace(Insets.sm),
                            controller.controllerUserInfo.user.value.status == 0
                                ? OutlinedButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.verifikasi);
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: AppColor.primaryColor,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            // Order nebeng
            // SliverToBoxAdapter(
            //   child: CardRoundedClickable(
            //     shadow: Shadows.universal,
            //     onTap: () {
            //       Get.toNamed(Routes.detailNebeng);
            //     },
            //     margin: EdgeInsets.symmetric(
            //       horizontal: Insets.med,
            //       vertical: Insets.sm,
            //     ),
            //     color: AppColor.whiteColor,
            //     borderRadius: 15,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               "Pesanan nebeng anda",
            //               style: TextStyles.textSm,
            //             ),
            //             Icon(
            //               Icons.arrow_forward_ios,
            //               size: IconSizes.sm,
            //             ),
            //           ],
            //         ),
            //         verticalSpace(Insets.med),
            //         Text(
            //           "Kijang inova",
            //           style: TextStyles.textLg,
            //         ),
            //         verticalSpace(Insets.med),
            //         SizedBox(
            //           // color: Colors.blue,
            //           height: 75,
            //           child: Row(
            //             children: [
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   RichText(
            //                     textAlign: TextAlign.end,
            //                     text: TextSpan(
            //                       text: "25 oktober 2022",
            //                       style: TextStyles.textXs
            //                           .copyWith(color: Colors.black54),
            //                       children: [
            //                         TextSpan(
            //                           text: "\n09:00",
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   RichText(
            //                     textAlign: TextAlign.end,
            //                     text: TextSpan(
            //                       text: "25 oktober 2022",
            //                       style: TextStyles.textXs
            //                           .copyWith(color: Colors.black54),
            //                       children: [
            //                         TextSpan(
            //                           text: "\n10:00",
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               horizontalSpace(Insets.xs),
            //               Column(
            //                 children: [
            //                   AppIcons.smallIcon(
            //                     AppIcons.locationStart,
            //                     size: Sizes.sm,
            //                   ),
            //                   Expanded(
            //                     child: VerticalDivider(
            //                       color: AppColor.neutral.shade300,
            //                       thickness: 1,
            //                       width: 20,
            //                     ),
            //                   ),
            //                   AppIcons.smallIcon(
            //                     AppIcons.locationIn,
            //                     size: Sizes.sm,
            //                   ),
            //                 ],
            //               ),
            //               horizontalSpace(Insets.xs),
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     "Samarinda",
            //                     style: TextStyles.textXs,
            //                   ),
            //                   Text(
            //                     "Balikpapan",
            //                     style: TextStyles.textXs,
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            //Menu utama
            SliverToBoxAdapter(
              child: Column(
                children: [
                  verticalSpace(Insets.sm),
                  Text(
                    "Layanan apa yang anda butuhkan ?",
                    style: TextStyles.textTableOrange,
                  ),
                  verticalSpace(Insets.med),
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
                            if (controller
                                    .controllerUserInfo.user.value.status ==
                                2) {
                              Get.toNamed(Routes.create_order);
                            } else {
                              var message = controller.controllerUserInfo.user
                                          .value.status ==
                                      0
                                  ? "Silahkan lengkapi data anda untuk menggunakan layanan kami"
                                  : "Admin sedang memverivikasi data anda mohon tunggu";
                              Get.snackbar("Pemberitahuan", message);
                            }
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
                            if (controller
                                    .controllerUserInfo.user.value.status ==
                                2) {
                              Get.toNamed(Routes.termNebeng);
                            } else {
                              var message = controller.controllerUserInfo.user
                                          .value.status ==
                                      0
                                  ? "Silahkan lengkapi data anda untuk menggunakan layanan kami"
                                  : "Admin sedang memverivikasi data anda mohon tunggu";
                              Get.snackbar("Pemberitahuan", message);
                            }
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
                          title: "Riwayat Pesanan",
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
              child: Obx(
                () => controller.loading.isFalse
                    ? Padding(
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
                              height: 240.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.homeResponse.value
                                    .adsResponse?.ads?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        right: 20, bottom: Insets.xs),
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.network(
                                                  imageUrlPath(
                                                      "${controller.homeResponse.value.adsResponse?.ads?[index]?.adsPict}"),
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
                                                "${controller.homeResponse.value.adsResponse?.ads?[index]?.adsTitle}",
                                                style: TextStyles.textStd,
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
                                                "${controller.homeResponse.value.adsResponse?.ads?[index]?.adsDesc}",
                                                style: TextStyle(
                                                    fontSize: FontSizes.s11),
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
                      )
                    : SizedBox(
                        width: Get.width,
                        height: 240.h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        ),
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
                      width: 50.w,
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
                      size: 100.w,
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
      child: CardRoundedClickable(
        shadow: Shadows.universal,
        onTap: ontap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(65),
              child: Container(
                padding: EdgeInsets.all(Insets.med),
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
    );
  }
}
