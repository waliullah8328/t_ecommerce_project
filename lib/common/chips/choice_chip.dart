import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_function.dart';
import '../widges/custom_shapes/containers/circular_container.dart';


class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onSelected,
  });

  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor =  THelperFunction.getColor(text)!= null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:  isColor? const SizedBox():  Text(text),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle:  TextStyle(color: isSelected ? TColors.white : null),
        avatar: isColor?TCircularContainer(width: 50,height: 50,backgroundColor:THelperFunction.getColor(text)!,):
        null,
        shape:isColor?const CircleBorder():null,
        labelPadding:isColor ? const EdgeInsets.all(0):null,
        padding: isColor?const EdgeInsets.all(0):null,
        backgroundColor:isColor ? THelperFunction.getColor(text)!:null,
      
      ),
    );
  }
}