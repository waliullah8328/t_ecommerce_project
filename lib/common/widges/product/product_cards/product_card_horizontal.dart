import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/common/widges/product/product_cards/product_card_vertical.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../custom_shapes/containers/TRoundedContainer.dart';
import '../../icons/circular_icon.dart';
import '../../images/t_rounded_images.dart';
import '../../text/product_price_text.dart';
import '../../text/product_title_text.dart';


class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey),
      child: Row(
        children: [
          // Thumnail
          TRoundedContainer(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                // Thumnail Image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                      imageUrl: TImages.user1,
                      applyImageRadius: true,
                    )),

                // Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                // Favorite Icon
                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    )),
              ],
            ),
          ),

          // Details
          SizedBox(
            width: 188,
            child: Padding(
              padding:  const EdgeInsets.only(left: TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: TSizes.sm, right: TSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: "Green Nike Air ",
                          smallSize: true,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        TBrandTitleTextWithVarifiedIcon(
                          title: "Nike",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      const Flexible(
                        child: TProductPriceText(
                          price: '35.5',
                        ),
                      ),

                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: TColors.dark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight:
                                    Radius.circular(TSizes.productImageRadius),
                              )),
                          child: const SizedBox(
                              width: TSizes.iconLg * 1.2,
                              height: TSizes.iconLg * 1.2,
                              child: Center(
                                  child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              ))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
