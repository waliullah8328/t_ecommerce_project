import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/features/authentication/controller/login/login_controller.dart';
import 'package:t_ecommerce_project/utils/validators/validator.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configaration/forget_password.dart';
import '../../signUp/signUp_screen.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key:controller.formKey ,
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value)=> TValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTextStrings.email
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFieldRadius,),

          // Password
          Obx(() =>  TextFormField(
              controller: controller.password,
              validator: (value)=>TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTextStrings.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye)),
              ))),
          const SizedBox(height: TSizes.spaceBtwInputFieldRadius/2,),

          // Remember Me and Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember Me
              Row(
                children: [
                 Obx(() =>  Checkbox(value:controller.rememberMe.value, onChanged: (value)=>controller.rememberMe.value= !controller.rememberMe.value)),
                  const Text(TTextStrings.rememberMe),
                ],
              ),

              // Forget Password
              TextButton(onPressed: ()=> Get.to(()=> const ForgetPassword()), child: const Text(TTextStrings.forgetPassword))
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),

          // Sign In Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.emailAndPasswordSignIn(), child: const Text(TTextStrings.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems,),

          // Create Account Button
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: (){
                Get.to(const SignUpScreen());
              }, child: const Text(TTextStrings.createAccount))),


        ],
      ),
    ));
  }
}