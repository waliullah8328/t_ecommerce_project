import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widges/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../common/widges/product/ratings/product_rating_bar_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';


class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.user1),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text("Jon Doe",style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        // Review
         Row(children: [
          const TRatingBarIndicator(rating: 4),
           const SizedBox(width: TSizes.spaceBtwItems,),
          Text("8 Aug, 2024",style: Theme.of(context).textTheme.bodyMedium,)

        ],),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText("Ratings and Reviews are verified and are the from people who use same type of device that you use. I am wali Ullah Ripon. ",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "Show less",
          trimCollapsedText: "Show more",
          moreStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
          lessStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        // Company Review
        TRoundedContainer(
          backgroundColor: dark? TColors.darkGrey:TColors.grey,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("8 Aug, 2024",style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText("Ratings and Reviews are verified and are the from people who use same type of device that you use. I am wali Ullah Ripon. ",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "Show less",
                  trimCollapsedText: "Show more",
                  moreStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
                  lessStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: TColors.primary),
                ),

              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),

        
      ],
    );
  }
}
