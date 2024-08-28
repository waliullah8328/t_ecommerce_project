import 'package:flutter/material.dart';

import '../../../../../common/widges/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../common/widges/images/t_circular_image.dart';
import '../../../../../common/widges/product/product_cards/product_card_vertical.dart';
import '../../../../../common/widges/text/product_price_text.dart';
import '../../../../../common/widges/text/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';


class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and Sale Price
        Row(children: [

          // Sale Tag
          TRoundedContainer(
            radius: TSizes.sm,
            backgroundColor: TColors.secondary.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
            child: Text("25%",style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            
            
          ),
          const SizedBox(width: TSizes.spaceBtwItems,),

          // Price
          Text("\$ 250",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
          const SizedBox(width: TSizes.spaceBtwItems,),
          const TProductPriceText(price: "175",isLarge: true,),

        ],),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        // Title
        const TProductTitleText(title: "Green Nike Sport Shirt",),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        // Stock status
        Row(
          children: [
            const TProductTitleText(title: "Status",),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("In Stock",style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        // brand
        Row(
          children: [
            TCircularImage(image: TImages.shoeIcon,width: 32,height: 32,overlayColor: dark? TColors.white:TColors.black,),
            const SizedBox(width: TSizes.spaceBtwItems/1.5,),
            const TBrandTitleTextWithVarifiedIcon(title: "Nike",brandTextSize: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
