import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_ecommerce_project/utils/helpers/helper_function.dart';

import '../../utils/constants/colors.dart';

class TSimmerEffect extends StatelessWidget {
  const TSimmerEffect(
      {super.key,
      required this.width,
      required this.height,
       this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Shimmer.fromColors(

        baseColor:dark? Colors.grey[850]!:Colors.grey[300]!,
        highlightColor: dark? Colors.grey[700]!:Colors.grey[100]!,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color??(dark?TColors.darkerGrey: TColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),


        ),

    );
  }
}
