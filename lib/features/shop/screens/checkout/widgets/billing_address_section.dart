import 'package:flutter/material.dart';

import '../../../../../common/widges/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';


class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: "Shipping Address", buttonTitle: "Change",onPress: (){},),
        Text("Wali Ullah Ripon",style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone,size: 16,color: TColors.grey,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("01751138328",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.location_history,size: 16,color: TColors.grey,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Flexible(child: Text("Besides East, 21/A,Road/2,Block-A, Merul badda,Aftab Nagar",maxLines:2,style: Theme.of(context).textTheme.bodyLarge,))
          ],
        ),

      ],
    );
  }
}
