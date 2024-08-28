
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';


class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key, required this.text,

  });


  final String text;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark? TColors.darkGrey: TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,)),
        Text(text.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark? TColors.darkGrey: TColors.grey,thickness: 0.5,indent: 5,endIndent: 60,)),

      ],
    );
  }
}