import 'package:flutter/material.dart';

import '../../../../../common/widges/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../common/widges/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';


class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: "Payment Method", buttonTitle: "Change",onPress: (){},),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height:35 ,
              backgroundColor: dark? TColors.light:TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.paypal)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Text("Paypal",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],

    );
  }
}
