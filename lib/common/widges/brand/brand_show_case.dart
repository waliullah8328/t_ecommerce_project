import 'package:flutter/material.dart';
import 'package:t_ecommerce_project/common/widges/brand/t_brand_card.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/TRoundedContainer.dart';


class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all( TSizes.md),
      child: Column(
        children: [
          // Brand With Product Count
          const TBranCard(showBorder: false,),
          const SizedBox(height: TSizes.spaceBtwItems,),

          // Brand Top Three Product
          Row(
            children: images.map((image) => brandTopProductImageWidget(context, image)).toList(),
          ),
          

        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget(BuildContext context,String image) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunction.isDarkMode(context)? TColors.darkGrey:TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.only(right: TSizes.md),
        child:  Image(image: AssetImage(image),fit: BoxFit.contain,),
      ),
    );
  }
}