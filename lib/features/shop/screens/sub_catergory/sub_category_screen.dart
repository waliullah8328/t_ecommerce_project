import 'package:flutter/material.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/images/t_rounded_images.dart';
import '../../../../common/widges/product/product_cards/product_card_horizontal.dart';
import '../../../../common/widges/text/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';


class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text("Sport"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banners
              const TRoundedImage(imageUrl: TImages.promoBanner1,height: null,width: double.infinity,applyImageRadius: true,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              // Sub Catergories
              Column(children: [
                // Heading
                TSectionHeading(title: "Sport shirt's",onPress: (){},),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_,index)=>const TProductCardHorizontal(),
                    separatorBuilder: (_,__)=> const SizedBox(width: TSizes.spaceBtwItems,),



                  ),
                ),

              ],)

            ],
          ),
        ),
      ),
    );
  }
}
