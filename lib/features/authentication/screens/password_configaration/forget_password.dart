import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/features/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:t_ecommerce_project/features/authentication/screens/password_configaration/reset_password.dart';
import 'package:t_ecommerce_project/utils/validators/validator.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(TTextStrings.forgotPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTextStrings.forgotPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections*2,),

            // Text Field
            Form(
              key: controller.forgetPasswordResetFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value)=>TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: TTextStrings.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Submit Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text(TTextStrings.submit)))

          ],
        ),

      ),
    );
  }
}
