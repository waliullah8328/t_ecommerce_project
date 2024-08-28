import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controller/signUp/signup_controller.dart';

class TTermAndConditions extends StatelessWidget {
  const TTermAndConditions({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value)=> controller.privacyPolicy.value= !controller.privacyPolicy.value))),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text.rich(TextSpan(
            children: [
              TextSpan(text: "${TTextStrings.iAgreeTo} ",style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: TTextStrings.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? TColors.white: TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:  dark? TColors.white: TColors.primary,
              )),

              TextSpan(text: " ${TTextStrings.and} ",style: Theme.of(context).textTheme.bodySmall),

              TextSpan(text: TTextStrings.termsOfUse,style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? TColors.white: TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:  dark? TColors.white: TColors.primary,
              )),
            ]

        )),

      ],
    );
  }
}