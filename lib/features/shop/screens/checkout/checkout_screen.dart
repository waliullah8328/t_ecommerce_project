import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_ecommerce_project/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_ecommerce_project/features/shop/screens/checkout/widgets/billing_payment_section.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/widges/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../common/widges/product/product_cart/cupon_promo_code/cupon_code.dart';
import '../../../../common/widges/product/product_cart/t_cart_items.dart';
import '../../../../common/widges/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              const TCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Cupon Field
              const TCuponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    TBillingAmountSection(),

                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //PayMent method
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    // Address
                    BillingAddressSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() =>  SuccessScreen(
                image: TImages.staticSuccessIllustration,
                title: "Payment Success!",
                subtitle: "Your item will be shipped soon!",

                onPress: ()=> Get.to(()=> const NavigationMenu()),
            ),
              
            ),
            child: const Text("Checkout \$ 325.0")),
      ),
    );
  }
}
