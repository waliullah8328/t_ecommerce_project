import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curve_edges/curved_edges_widget.dart';
import 'circular_container.dart';


class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(child: Container(
      color: TColors.primary,
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(top:-150,right:-250,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),)),
          Positioned(top:100,right:-300,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),)),
          child,


        ],
      ),
    ),);
  }
}