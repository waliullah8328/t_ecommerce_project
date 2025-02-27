import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widges/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';


class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace/2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                height: 40,
                width: 40,
                color: TColors.white,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              const TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                height: 40,
                width: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: TColors.black,
                side: const BorderSide(color: Colors.black),
              ),
              child: const Text("Add to Cart")),
        ],
      ),
    );
  }
}
