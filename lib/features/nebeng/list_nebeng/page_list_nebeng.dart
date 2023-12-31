import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/controller_list_nebeng.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/nebeng_posting_item.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/nebeng_posting_shimmer.dart';
import 'package:intake_customer/response/nebeng_response.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/constans/assets.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/helpers/currency_formatter.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/widgets/buttons/button_primary.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded.dart';
import 'package:intake_customer/shared/widgets/cards/card_rounded_clickable.dart';
import 'package:intake_customer/shared/widgets/inputs/input_date.dart';
import 'package:intake_customer/shared/widgets/inputs/input_selection.dart';
import 'package:intake_customer/shared/widgets/others/loading_indicator.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
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
      toolbarElevation: 1,
      padding: EdgeInsets.zero,
      child: Obx(
        () => LoadingOverlay(
          isLoading: controller.loading.value,
          opacity: 0.5,
          color: AppColor.secondary,
          progressIndicator: loadingIndicator(context),
          child: RefreshIndicator(
            onRefresh: () async => controller.onRefresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const CardInfoProkes(),
                  FilterWidget(
                    controller: controller,
                  ),
                  controller.loadingList.isFalse
                      ? controller.listNebeng.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  vertical: Insets.sm, horizontal: Insets.sm),
                              itemCount: controller.listNebeng.length,
                              itemBuilder: (context, index) =>
                                  NebengPostingItem(
                                      nebengPost: controller.listNebeng[index]),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(AppLotties.emptyList,
                                    height: 230.w),
                                Text(
                                  "Belum ada nebeng yang tersedia",
                                  style: TextStyles.textSm,
                                ),
                                verticalSpace(Insets.lg),
                              ],
                            )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              vertical: Insets.sm, horizontal: Insets.sm),
                          itemCount: 5,
                          itemBuilder: (context, index) =>
                              const NebengPostingShimmer(),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardInfoProkes extends StatefulWidget {
  const CardInfoProkes({Key? key}) : super(key: key);

  @override
  State<CardInfoProkes> createState() => _CardInfoProkesState();
}

class _CardInfoProkesState extends State<CardInfoProkes> {
  double _height = 55.h;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.webView, arguments: {
          'title': "Panduan protokol kesehatan",
          'url': "https://antaranter.com/panduan-protokol-kesehatan",
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: Insets.sm),
        // Use the properties stored in the State class.
        width: Get.width,
        height: _height,
        color: AppColor.primaryColor,
        // Define how long the animation should take.
        duration: const Duration(milliseconds: 500),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.easeOut,
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: AppColor.whiteColor,
              size: IconSizes.med,
            ),
            horizontalSpace(Insets.sm),
            Expanded(
              child: Text(
                "Informasi panduan protokol kesehatan",
                style: TextStyles.inter.copyWith(
                  color: AppColor.whiteColor,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _height = 0;
                });
              },
              icon: Icon(
                Icons.close,
                size: Sizes.sm,
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ControllerListNebeng controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CardRounded(
        borderRadius: 0,
        shadow: Shadows.shadowsUp,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            InputSelection(
              label: "Kota keberangkatan",
              valueText: controller.selectedCityDept.value,
              hintText: "Pilih kota keberangkatan",
              onTap: () {
                controller.buildCitiesDep(context);
              },
              padding: EdgeInsets.all(Insets.sm),
              margin: EdgeInsets.only(bottom: Insets.xs),
              width: Get.width,
            ),
            InputSelection(
              label: "Kota tujuan",
              valueText: controller.selectedCityArv.value,
              hintText: "Pilih kota tujuan",
              onTap: () {
                controller.buildCitiesArv(context);
              },
              padding: EdgeInsets.all(Insets.sm),
              margin: EdgeInsets.only(bottom: Insets.xs),
              width: Get.width,
            ),
            InputDate(
              margin: EdgeInsets.only(bottom: Insets.xs),
              label: "Tanggal Keberangkatan",
              hintText: 'Pilih Tanggal Berangkat',
              controller: controller.txtDateDeptStart,
              selectedDate: (value) {
                controller.txtDateDeptEnd.text =
                    DateFormat('yyyy-MM-dd').format(value);
                controller.initDateEnd.value = value;
              },
              isValid: (value) {},
              suffixIcon: const Icon(
                Icons.date_range,
                color: AppColor.greyColor,
                size: 20,
              ),
              boxWidth: Get.width,
              initialDate: DateTime(
                controller.now.year,
                controller.now.month,
                controller.now.day + 1,
              ),
              firstDate: DateTime(
                controller.now.year,
                controller.now.month,
                controller.now.day + 1,
              ),
            ),
            InputDate(
              margin: EdgeInsets.only(bottom: Insets.xs),
              label: "Sampai dengan",
              hintText: 'Pilih Tanggal Berangkat',
              controller: controller.txtDateDeptEnd,
              selectedDate: (value) {},
              isValid: (value) {},
              suffixIcon: const Icon(
                Icons.date_range,
                color: AppColor.greyColor,
                size: 20,
              ),
              boxWidth: Get.width,
              initialDate: controller.initDateEnd.value,
              firstDate: controller.initDateEnd.value,
            ),
            ButtonPrimary(
              onPressed: () {
                controller.searchData();
              },
              label: "Cari",
              height: Sizes.lg,
              cornerRadius: Corners.med,
            ),
          ],
        ),
      ),
    );
  }
}
