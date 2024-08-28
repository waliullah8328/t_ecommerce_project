import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/t_rounded_images.dart';
import '../../text/product_title_text.dart';
import '../product_cards/product_card_vertical.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        // Image
        TRoundedImage(
          imageUrl: TImages.shoeIcon,
          width: 60,
          height: 60,
          padding:const  EdgeInsets.all(TSizes.sm),
          background:dark? TColors.darkerGrey:TColors.light ,
        ),

        const SizedBox(width: TSizes.spaceBtwItems,),

        // Title, Price, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVarifiedIcon(title: "Nike"),
              const Flexible(child: TProductTitleText(title: "Black Sports Shoes ",maxLines: 1,)),

              // Attributes
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: "Size ",style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "UK 08 ",style: Theme.of(context).textTheme.bodyLarge),
                  ]
              ))
            ],
          ),
        )

      ],
    );
  }
}
