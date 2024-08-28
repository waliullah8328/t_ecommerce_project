import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/brand/t_brand_card.dart';
import '../../../../common/widges/layout/grid_layout.dart';
import '../../../../common/widges/text/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_product.dart';


class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        title: Text("Brand"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: "Brands",showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              // Brands
              TGridLayout(itemCount: 6, itemBuilder: (context,index)=>  TBranCard(showBorder: true,onTap: ()=>Get.to(()=>const BrandProduct()),),mainAxisExtent: 80,)
            ],
          ),
        ),
      ),
    );
  }
}
