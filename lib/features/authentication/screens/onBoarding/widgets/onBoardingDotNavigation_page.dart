import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utilities.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controller/controllers.onboarding/controllers_onboarding.dart';



class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(activeDotColor:dark?TColors.white: TColors.dark,dotHeight: 6),
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3));
  }
}