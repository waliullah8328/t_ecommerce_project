
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../custom_shapes/containers/TRoundedContainer.dart';


class TCuponCode extends StatelessWidget {
  const TCuponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark? TColors.dark: TColors.white,
      padding: const EdgeInsets.only(left: TSizes.md,right: TSizes.sm,bottom: TSizes.sm,top: TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),

          // Button
          SizedBox(width:80,
              child:
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: dark?TColors.white.withOpacity(0.5):TColors.dark.withOpacity(0.5),
                    backgroundColor: TColors.grey.withOpacity(0.2),
                    side: BorderSide(color:TColors.grey.withOpacity(0.1) ),
                  ),
                  child: const Text("Apply"))),

        ],
      ),

    );
  }
}