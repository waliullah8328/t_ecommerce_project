import 'package:flutter/material.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/product/sortable_product/sortable_product.dart';
import '../../../../utils/constants/sizes.dart';


class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text("Popular Products"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TSortAbleProduct(),
        ),
      ),
    );
  }
}


