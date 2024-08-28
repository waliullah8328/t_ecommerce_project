import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.height=170,
    this.width=750,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.background = TColors.light,
    this.fit,
    this.padding,
    this.isNetworkImage = false,
    this.onPress,
    this.borderRadius = TSizes.md,
  });

  final double? height, width;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? background;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPress;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: background
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius?BorderRadius.circular(borderRadius!): BorderRadius.zero,
          child:  Image(
              fit: fit,
              image: isNetworkImage? NetworkImage(imageUrl):AssetImage(imageUrl) as ImageProvider),
        ),
      ),

    );
  }
}