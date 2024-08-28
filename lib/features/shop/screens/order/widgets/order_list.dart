import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widges/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';


class TOrdersItems extends StatelessWidget {
  const TOrdersItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return ListView.separated(
      itemBuilder: (_,index)=> TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark? TColors.dark: TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
              children: [
      
                // 1. Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBtwItems/2,),
      
                // 2. Status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Processing",style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                      Text("07 Nov,2024",style: Theme.of(context).textTheme.headlineSmall),
                  
                    ],
                  ),
                ),
      
                // 3. Icon button
      
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3)),
      
                
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
      
            // Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                  
                      // 1. Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),
                  
                      // 2. Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order",style: Theme.of(context).textTheme.labelMedium),
                            Text("[#256f2]",style: Theme.of(context).textTheme.titleMedium),
                  
                          ],
                        ),
                      ),
                  
                  
                  
                  
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                  
                      // 1. Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),
                  
                      // 2. Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date",style: Theme.of(context).textTheme.labelMedium),
                            Text("10 Nov, 2024",style: Theme.of(context).textTheme.titleMedium),
                  
                          ],
                        ),
                      ),
                  
                  
                  
                  
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      itemCount: 10,
      separatorBuilder: (_,__)=>const SizedBox(height: TSizes.spaceBtwItems,),
    );
  }
}
