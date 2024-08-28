import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/icons/circular_icon.dart';
import '../../../../common/widges/product/product_cart/t_cart_items.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../checkout/checkout_screen.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()), child:const Text("Checkout \$ 260.0")),
      ),
    );
  }
}

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        TCircularIcon(icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: dark? TColors.white:TColors.black,
         backgroundColor: dark? TColors.darkerGrey:TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems,),
        Text("2",style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        const TCircularIcon(icon: Icons.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}

