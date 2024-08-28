import 'package:flutter/material.dart';
import 'package:t_ecommerce_project/common/widges/images/t_circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor= TColors.white,
    this.backgroundColor = TColors.white,
    this.onPress, this.isNetworkImage= true,
  });

  final String image, title;
  final Color textColor;
  final Color backgroundColor;
  final bool isNetworkImage;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
                image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark?TColors.light:TColors.dark,

            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            // Text
            SizedBox(
                width: 55,

                child: Text(textAlign: TextAlign.center,
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                ))
          ],
        ),
      ),
    );
  }
}