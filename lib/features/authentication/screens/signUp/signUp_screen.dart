import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/features/authentication/screens/signUp/widgets/signUp_form.dart';

import '../../../../common/widges/widgets_login_singUp/divider.dart';
import '../../../../common/widges/widgets_login_singUp/social_media.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    Color white = Colors.white;
    Color black = Colors.black;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios_new,color: dark? white:black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTextStrings.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Form
              const TSignUpForm(),
              const TFormDivider(text: TTextStrings.orSignUpWith,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              // Footer
              // Social Button
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}

