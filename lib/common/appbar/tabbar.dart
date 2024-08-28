import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/device/device_utilities.dart';
import '../../utils/helpers/helper_function.dart';


class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  const TTabbar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
      color: dark? TColors.black: TColors.white,

      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: dark? TColors.white: TColors.primary ,
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
