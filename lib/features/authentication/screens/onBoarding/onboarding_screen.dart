import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/features/authentication/screens/onBoarding/widgets/onBoardingDotNavigation_page.dart';
import 'package:t_ecommerce_project/features/authentication/screens/onBoarding/widgets/onBoardingNextButton_page.dart';
import 'package:t_ecommerce_project/features/authentication/screens/onBoarding/widgets/onBoardingSkip_page.dart';
import 'package:t_ecommerce_project/features/authentication/screens/onBoarding/widgets/onBoarding_page.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controller/controllers.onboarding/controllers_onboarding.dart';





class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(children: [
        // Horizontal Scrollable Page

        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: TImages.onBoardingImage1,
              title: TTextStrings.onBoardingTitle1,
              subtitle: TTextStrings.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage2,
              title: TTextStrings.onBoardingTitle2,
              subtitle: TTextStrings.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage3,
              title: TTextStrings.onBoardingTitle3,
              subtitle: TTextStrings.onBoardingSubTitle3,
            ),
          ],
        ),

        /// Skip Button
        const OnBoardingSkip(),

        /// Dot navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        /// Circular button
        const OnBoardingNextButton(),
      ]),
    );
  }
}




