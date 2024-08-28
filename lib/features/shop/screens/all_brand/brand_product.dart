import 'package:flutter/material.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/brand/t_brand_card.dart';
import '../../../../common/widges/product/sortable_product/sortable_product.dart';
import '../../../../utils/constants/sizes.dart';


class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Nike"),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBranCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),
              TSortAbleProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
