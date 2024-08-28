import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/icons/circular_icon.dart';
import '../../../../common/widges/layout/grid_layout.dart';
import '../../../../common/widges/product/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../home/home_screen.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Wishlist",style: Theme.of(context).textTheme.headlineMedium,),
        action: [
          TCircularIcon(icon: Iconsax.add,onPress: ()=> Get.to(const HomeScreen()),)
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder:(_,index)=>const TProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
