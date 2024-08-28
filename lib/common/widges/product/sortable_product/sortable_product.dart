import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class TSortAbleProduct extends StatelessWidget {
  const TSortAbleProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DropDown Button
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          items: ["Name","Higher Price","Lower Price","Sale","Newest","Popularity"].map((option) => DropdownMenuItem(value:option,child: Text(option))).toList(),

          onChanged: (value){},
        ),

        const SizedBox(height: TSizes.spaceBtwSections,),

        ///Products
        TGridLayout(itemCount: 6, itemBuilder: (_,index)=> const TProductCardVertical()),
      ],
    );
  }
}