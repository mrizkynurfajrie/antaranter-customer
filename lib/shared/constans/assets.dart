import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intake_customer/shared/constans/styles.dart';

class AppIcons {
  static const boxOrange = 'assets/icons/box-orange.png';
  static const historyOrder = 'assets/icons/history-order.png';
  static const customerService = 'assets/icons/customer-service.png';
  static const locationIn = 'assets/icons/location-in.png';
  static const locationTake = 'assets/icons/location-take.png';
  static const locationStart = 'assets/icons/location-start.png';
  static const titipIcon = 'assets/icons/titip-icon.png';
  static const kurirIcon = 'assets/icons/kurir-icon.png';
  static const nebengIcon = 'assets/icons/nebeng-icon.png';
  static const historyIcon = 'assets/icons/history-icon.png';
  static const termsIcon = 'assets/icons/terms-icon.png';
  static const seat = 'assets/icons/seat.png';
  static const minivan = 'assets/icons/minivan.png';
  static const priceTag = 'assets/icons/price-tag.png';
  static const profileComp = 'assets/icons/profile-comp.png';
  static const licencePlate = 'assets/icons/licence-plate.png';
  static const whatsapp = 'assets/icons/whatsapp.png';
  static const home = 'assets/icons/home.svg';
  static const activity = 'assets/icons/activity.svg';
  static const profile = 'assets/icons/profile.svg';
  static const colour = 'assets/icons/colour.png';
  static const wa = 'assets/icons/wa-icon.png';
  static const ig = 'assets/icons/ig-icon.png';
  static const fb = 'assets/icons/fb-icon.png';
  static const email = 'assets/icons/email-icon.png';
  static const web = 'assets/icons/web-icon.png';
  static const dummyAvatar = 'assets/images/avatar_dummy.svg';
  static const confirmData = 'assets/images/confirm_data.png';
  static const genderFemale = 'assets/icons/gender-female.svg';
  static const genderMale = 'assets/icons/gender-male.svg';

  static Widget smallIcon(String asset, {double? size}) {
    return Image.asset(
      asset,
      height: size ?? IconSizes.sm,
    );
  }
}

class AppLogos {
  static const logoOnlySvg = 'assets/logo/antaranter-logo-only.svg';
  static const logoOnlyWhiteSvg = 'assets/logo/antaranter-logo-only-white.svg';
  static const logoHorizontalSvg = 'assets/logo/antaranter-horizontal.svg';
  static const logoVerticalSvg = 'assets/logo/antaranter-logo-vertical.svg';
  // static const logoTextOnlySvg = 'assets/logo/antaranter-text-only.svg';

  static const logoOnlyPng = 'assets/logo/antaranter-logo-only.png';
  static const logoOnlyWhitePng = 'assets/logo/antaranter-logo-only-white.png';
  static const logoHorizontalPng = 'assets/logo/antaranter-horizontal.png';
  static const logoVerticalPng = 'assets/logo/antaranter-logo-vertical.png';
  // static const logoTextOnlyPng = 'assets/logo/antaranter-text-only.png';

  static Widget logoAppBar(String asset) {
    return Image.asset(
      asset,
      height: IconSizes.lg,
    );
  }

  static Widget logoAppBarSvg(String asset) {
    return SvgPicture.asset(
      asset,
      height: IconSizes.lg,
    );
  }
}

class AppLotties {
  static const loadingProcess = 'assets/lottie/loading-orange.json';
  static const loadingCar = 'assets/lottie/loading-car.json';
  static const empty = 'assets/lottie/empty.json';
  static const emptyList = 'assets/lottie/empty-list.json';
  static const errorIcon = 'assets/lottie/error.json';
}
