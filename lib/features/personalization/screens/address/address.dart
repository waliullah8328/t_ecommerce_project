import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/features/personalization/screens/address/single_address.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address_screen.dart';


class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(()=>const AddNewAddressScreen()),
        backgroundColor: TColors.primary,
        child: const Icon(Iconsax.add,color: TColors.white,),
      ),

      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Address",style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false,),
              SingleAddress(selectedAddress: true,),
              SingleAddress(selectedAddress: false,),
              SingleAddress(selectedAddress: false,),

            ],
          ),
        ),
      ),
    );
  }
}
