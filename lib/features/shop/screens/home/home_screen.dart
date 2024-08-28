import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_ecommerce_project/features/shop/screens/home/widgets/home_catergories.dart';
import 'package:t_ecommerce_project/features/shop/screens/home/widgets/t_promo_slider.dart';

import '../../../../common/widges/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widges/custom_shapes/containers/search_container.dart';
import '../../../../common/widges/layout/grid_layout.dart';
import '../../../../common/widges/product/product_cards/product_card_vertical.dart';
import '../../../../common/widges/text/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../all_product/all_product.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                // App Bar
                const THomeAppBar(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                // Search bar
                TSearchContainer(
                  text: "Search in Store",
                  onPress: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                // Categories
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      // Heading
                      TSectionHeading(
                        title: "Popular Categories",
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      // Categories horizontal
                      THomeCategories()
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections,),

              ],
            )),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // T Section Heading Property
                  TSectionHeading(title: "Popular Products",onPress: ()=> Get.to(()=>const AllProduct()),),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TGridLayout(itemCount: 4,itemBuilder: (_,index)=> const TProductCardVertical(),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


