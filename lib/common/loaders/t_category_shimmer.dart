import 'package:flutter/material.dart';
import 'package:t_ecommerce_project/common/loaders/simmer.dart';

import '../../utils/constants/sizes.dart';



class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key,  this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_,__) => const SizedBox(height:TSizes.spaceBtwItems),
          itemBuilder: (_,__){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              TSimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems/2,),
              
              // Text
              TSimmerEffect(width: 55, height: 88),

            ],
          );
          }
      ),
    );
  }
}
