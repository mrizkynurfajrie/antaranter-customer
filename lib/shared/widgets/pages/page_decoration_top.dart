import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/constans/styles.dart';
import 'package:intake_customer/shared/widgets/appbar/appbar.dart';

class PageDecorationTop extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget? bottomBar;
  final Widget? center;
  final double? bottomBarHeight;
  final bool enableBack;
  final Color? toolbarColor;
  final double toolbarElevation;
  final Color? toolbarTitleColor;
  final List<Widget>? toolbarAction;
  final EdgeInsets? padding;
  final Widget? iconBack;
  final Color? backgroundColor;
  final Function()? onBackPressed;

  const PageDecorationTop({
    Key? key,
    required this.child,
    required this.title,
    required this.center,
    this.bottomBar,
    this.bottomBarHeight,
    this.enableBack = true,
    this.toolbarColor,
    this.toolbarTitleColor,
    this.toolbarElevation = 0,
    this.toolbarAction,
    this.padding,
    this.iconBack,
    this.backgroundColor,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor ?? AppColor.whiteColor,
        appBar: CustomAppBar(
          title: title,
          color: toolbarColor ?? Theme.of(context).primaryColor,
          elevation: toolbarElevation,
          colorTitle: toolbarTitleColor,
          actions: toolbarAction,
          leadingIcon: enableBack ? iconBack : horizontalSpace(0),
          useLeading: enableBack,
          onBackPressed: onBackPressed ?? () => Get.back(),
          center: center,
        ),
        body: SafeArea(
            child: Padding(
          padding: padding ?? EdgeInsets.all(Insets.xl),
          child: child,
        )),
        bottomNavigationBar: bottomBar != null
            ? SizedBox(
                width: Get.width,
                height: bottomBarHeight ?? Sizes.xxl,
                child: bottomBar,
              )
            : verticalSpace(0));
  }
}
