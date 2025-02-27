import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/features/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:t_ecommerce_project/features/authentication/screens/login/login_screen.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            // Image
            Image(image:  const AssetImage(TImages.deliveredImageIllustration),width: THelperFunction.screenWidth()*0.6,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            //Text ,Title and Subtitle
            Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            Text(TTextStrings.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

            const SizedBox(height: TSizes.spaceBtwSections,),
            Text(TTextStrings.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.offAll(()=>const LoginScreen()), child: const Text(TTextStrings.done)),),
            const SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(width: double.infinity,child: TextButton(onPressed: ()=>ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TTextStrings.resendEmail)),),
          ],),
        ),
      ),
    );
  }
}
