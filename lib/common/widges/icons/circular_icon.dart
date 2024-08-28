import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';


class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
     this.width,
     this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPress,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null?
            backgroundColor!
          :dark
            ? TColors.black.withOpacity(0.9)
            : TColors.light.withOpacity(0.9),
      ),
      child: IconButton(onPressed: () {}, icon:Icon(icon,color: color,size: size,)),
    );
  }
}
