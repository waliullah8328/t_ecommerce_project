import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/data/repositories/authentication_repository/authentication_repository.dart';

import '../../../../../common/widges/success_screen/success_screen.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';
import '../../../controller/signUp/varify_email_controller.dart';
import '../../login/login_screen.dart';


class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(image: const AssetImage(TImages.deliveredImageIllustration),width: THelperFunction.screenWidth()*0.6,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              
              //Title and Subtitle
              Text(TTextStrings.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(email?? "",style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Text(TTextStrings.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              
              // Button
              SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: ()=>controller.checkEmailVerificationStatus(), child: const Text(TTextStrings.tContinue)),),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(width: double.infinity,child: TextButton(onPressed: ()=>controller.sendEmailVerification(), child: const Text(TTextStrings.resendEmail)),)
            ],
          ),
        ),
      ),
    );
  }
}
