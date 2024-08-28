import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utilities.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controller/controllers.onboarding/controllers_onboarding.dart';



class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        right: TSizes.defaultSpace,

        child: ElevatedButton(onPressed:()=>OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark? TColors.primary: Colors.black
            ),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}