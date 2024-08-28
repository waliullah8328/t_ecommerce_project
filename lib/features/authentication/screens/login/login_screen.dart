
import 'package:flutter/material.dart';
import 'package:t_ecommerce_project/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_ecommerce_project/features/authentication/screens/login/widgets/login_header.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widges/widgets_login_singUp/divider.dart';
import '../../../../common/widges/widgets_login_singUp/social_media.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo,Title,Subtitle
              TLoginHeader(dark: dark),

              // Form

               const TLoginForm(),

              // Divider
              const TFormDivider(text: TTextStrings.orSignInWith,),

              const SizedBox(height: TSizes.spaceBtwSections,),


              // Footer

              const TSocialButton()
            ],
          ),
        ),

      ),
    );
  }
}








