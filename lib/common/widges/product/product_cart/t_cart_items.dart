import 'package:flutter/material.dart';

import '../../../../features/shop/screens/cart/cart_screen.dart';
import '../../../../utils/constants/sizes.dart';
import '../../text/product_price_text.dart';
import 'cart_item.dart';


class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton= true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButton)const SizedBox(height: TSizes.spaceBtwItems,),

          if(showAddRemoveButton)const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              // Add and  remove button

              TProductPriceText(price: "256"),



            ],
          )
        ],
      ),
    );
  }
}
