import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widges/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';


class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: selectedAddress? TColors.primary.withOpacity(0.5): Colors.transparent,
      borderColor: selectedAddress? Colors.transparent :dark?TColors.darkerGrey:TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress?Iconsax.tick_circle5:null,
              color: selectedAddress? dark? TColors.light:TColors.dark:null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jon doe",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: TSizes.sm/2,),

              const SizedBox(height: TSizes.sm/2,),
              const Text("01751138328",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

              ),

              const SizedBox(height: TSizes.sm/2,),
              const Text("Besides East, 21/A,Road/2,Block-A, Merul badda,Aftab Nagar, Dhaka 1212",
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,

              ),


            ],
          )

        ],
      ),

    );
  }
}
