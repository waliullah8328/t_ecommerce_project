import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/features/authentication/controller/signUp/signup_controller.dart';
import 'package:t_ecommerce_project/features/authentication/screens/signUp/widgets/sigUp_terms_ans_condition.dart';
import 'package:t_ecommerce_project/utils/validators/validator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';


class TSignUpForm extends StatelessWidget {

  const TSignUpForm({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                      validator: (value)=>TValidator.validateEmptyText("First Name", value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTextStrings.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      )),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFieldRadius,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                      validator: (value)=>TValidator.validateEmptyText("Last Name", value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTextStrings.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFieldRadius,
            ),
            // User Name
            TextFormField(
              controller: controller.userName,
                validator: (value)=>TValidator.validateEmptyText("User Name", value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTextStrings.userName,
                  prefixIcon: Icon(Iconsax.user_edit),
                )),
            const SizedBox(
              height: TSizes.spaceBtwInputFieldRadius,
            ),
            // User Email
            TextFormField(
              controller: controller.email,
                validator: (value)=>TValidator.validateEmail(value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTextStrings.email,
                  prefixIcon: Icon(Iconsax.direct),
                )),

            const SizedBox(
              height: TSizes.spaceBtwInputFieldRadius,
            ),
            // User Phone Number
            TextFormField(
              controller: controller.phoneNumber,
                validator: (value)=>TValidator.validatePhoneNumber(value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTextStrings.phoneNumber,
                  prefixIcon: Icon(Iconsax.call),
                )),

            const SizedBox(
              height: TSizes.spaceBtwInputFieldRadius,
            ),
            // User Phone Number
           Obx(() =>  TextFormField(
              controller: controller.password,
                validator: (value)=>TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTextStrings.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye)),
                ))),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),


            // Terms and condition check box
            const TTermAndConditions(),
            const SizedBox(height: TSizes.spaceBtwSections,),


            // SignUp Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=>controller.signUp()
              , child: const Text(TTextStrings.createAccount)),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),
            // Divider



          ],
        ));
  }
}

