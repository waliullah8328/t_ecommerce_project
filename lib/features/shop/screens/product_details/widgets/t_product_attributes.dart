import 'package:flutter/material.dart';

import '../../../../../common/chips/choice_chip.dart';
import '../../../../../common/widges/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../common/widges/text/product_price_text.dart';
import '../../../../../common/widges/text/product_title_text.dart';
import '../../../../../common/widges/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        // Selected Attribute pricing
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Price and Stock status
              Row(
                children: [
                  const TSectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: "Price: ",
                            smallSize: true,
                          ),

                          // Actual Price
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          // Sale Price
                          const TProductPriceText(price: "20"),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: "Status: ",
                            smallSize: true,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const TProductTitleText(
                title:
                    "This is the Description of the product and it can go up to max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: "Colors",showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(

              spacing: 8,

              children: [
              TChoiceChip(text: 'Green',isSelected: true,onSelected: (val){},),
              TChoiceChip(text: 'Red',isSelected:false,onSelected: (val){},),
              TChoiceChip(text: 'Blue',isSelected:false,onSelected: (val){},),
            ],
            ),

          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: "Size",showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34',isSelected: true,onSelected: (val){},),
                TChoiceChip(text: 'EU 36',isSelected:false,onSelected: (val){},),
                TChoiceChip(text: 'EU 38',isSelected:false,onSelected: (val){},),
              ],
            )

          ],
        ),

      ],
    );
  }
}


