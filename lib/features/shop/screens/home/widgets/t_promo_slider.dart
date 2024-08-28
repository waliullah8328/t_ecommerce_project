import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widges/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widges/images/t_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/homeController.dart';


class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners.map((url) => TRoundedImage(imageUrl:url,fit: BoxFit.fill,)).toList(),


            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index,_)=>controller.updatePageIndicator(index),
            )),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Center(
          child: Obx(() => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i=0;i<banners.length;i++) TCircularContainer(
                width: 20,
                height: 4,
                margin: const EdgeInsets.only(right: 10),
                backgroundColor: controller.carousalCurrentIndex.value == i? TColors.primary:TColors.grey,
              ),


            ],
          )),
        ),
      ],
    );
  }
}