import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utilities.dart';
import '../../utils/helpers/helper_function.dart';


class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({super.key, this.title,  this.showBackArrow= false, this.leadingIcon, this.action, this.leadingOnPress});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Padding(padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed:()=> Get.back(), icon: Icon(Iconsax.arrow_left,color: dark? TColors.white:TColors.black,))
            : (leadingIcon != null)?IconButton(onPressed:leadingOnPress, icon: Icon(leadingIcon)):null,
        title: title,
        actions: action,

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
