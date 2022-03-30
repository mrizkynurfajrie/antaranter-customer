import 'package:flutter/material.dart';
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
  static const wa = 'assets/logo/wa-logo.png';
  static const ig = 'assets/logo/ig-logo.png';
  static const fb = 'assets/logo/fb-logo.png';
  static const email = 'assets/logo/email-logo.png';
  static const web = 'assets/logo/web-logo.png';

  static Widget smallIcon(String asset, {double? size}) {
    return Image.asset(
      asset,
      height: size ?? IconSizes.sm,
    );
  }
}

class AppLogos {
  static const logoColored = 'assets/logo/logo-besar.png';
  static const smallLogoColored = 'assets/logo/logo-kecil.png';

  static Widget logoAppBar(String asset) {
    return Image.asset(
      asset,
      height: IconSizes.xl,
    );
  }
}

class AppLotties {
  static const loadingProcess = 'assets/lottie/loading-orange.json';
  static const loadingCar = 'assets/lottie/loading-car.json';
  static const empty = 'assets/lottie/empty.json';
}
