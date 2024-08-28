import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_ecommerce_project/utils/constants/sizes.dart';

import '../../utils/constants/colors.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPress});

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation,width: MediaQuery.of(context).size.width*0.8), // Display Lottie animation
          const SizedBox(height: TSizes.defaultSpace,),
          Text(text,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
          const SizedBox(height: TSizes.defaultSpace,),
          showAction
          ? SizedBox(
            width: 200,
            child: OutlinedButton(
                onPressed: onActionPress,
                style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                child: Text(actionText!,style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),),
            ),
          ): const SizedBox()

        ],
      ),
    );
  }
}
