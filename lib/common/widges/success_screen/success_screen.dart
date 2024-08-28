import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../styles/spacing_styles.dart';



class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, this.onPress});
  final String image,title,subtitle;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(children: [
            // Image
            Image(image:  AssetImage(image),width: THelperFunction.screenWidth()*0.6,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            //Title and Subtitle
            Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

            const SizedBox(height: TSizes.spaceBtwSections,),
            Text(subtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPress, child: const Text(TTextStrings.tContinue)),),
          ],),
        ),
      ),
    );
  }
}
