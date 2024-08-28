
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_details/widgets/rating_and_sheare.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_details/widgets/t_product_attributes.dart';


import '../../../../common/widges/text/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../product_review/product_review.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return   Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Product Image Slider
             const TProductImageSlider(),

            // 2. Product Details
            Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
              child: Column(
                children: [

                  // Rating and share
                  const TRatingAndShare(),

                  // Price,title,stock, and brand
                  const ProductMetaData(),
                  // Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections,),


                  // Checkout button
                  
                  SizedBox(
                      width:double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  // Description

                  const TSectionHeading(title: "Description",showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  
                  const ReadMoreText("This is a product description for blue nike sleeve less vest.There are more thing that's are not introduced.Sorry offer are not elegible for this product",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Less",
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: "Reviews(199)",showActionButton: false,),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3,size: 18,),onPressed: ()=>Get.to(()=>const ProductReviewScreen()),)
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections,),



                ],
              ),
            ),
            
            


          ],
        ),
      ),
    );
  }
}




