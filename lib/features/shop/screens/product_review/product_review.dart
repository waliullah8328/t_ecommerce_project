import 'package:flutter/material.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_review/widgets/overall_rating_progress_indicator.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_review/widgets/user_review_card.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/product/ratings/product_rating_bar_indicator.dart';
import '../../../../utils/constants/sizes.dart';


class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // App Bar
      appBar: const TAppBar(title: Text("Reviews & Ratings",),showBackArrow: true,),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and Reviews are verified and are the from people who use same type of device that you use."),
              const SizedBox(height: TSizes.spaceBtwItems,),

              // Overall Product Rating
              const TOverallProductReview(),
              
              // Rating Bar
              
              const TRatingBarIndicator(rating: 4.5,),
              Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              // User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),


            ],
          ),
        ),

      ),
    );
  }
}






