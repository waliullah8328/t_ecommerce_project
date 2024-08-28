
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_ecommerce_project/common/loaders/simmer.dart';
import 'package:t_ecommerce_project/features/personalization/controllers/user_controller.dart';

import '../../../../../common/appbar/appbar.dart';
import '../../../../../common/widges/product/product_cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTextStrings.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Obx(() {
            if(controller.profileLogin.value){
              return const TSimmerEffect(width: 80, height: 15, );
            }
            else{
              return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),);

            }

          }),

        ],
      ),
      action: [
        TCartCounterIcon(onPress: (){},iconColor: TColors.white,),
      ],

    );
  }
}