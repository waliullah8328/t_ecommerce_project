import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/common/appbar/appbar.dart';
import 'package:t_ecommerce_project/features/personalization/controllers/user_controller.dart';
import 'package:t_ecommerce_project/utils/constants/sizes.dart';
import 'package:t_ecommerce_project/utils/constants/text_strings.dart';
import 'package:t_ecommerce_project/utils/validators/validator.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const TAppBar(title: Text("Re-Authenticate User"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthenticateFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value)=>TValidator.validateEmail(value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: TTextStrings.email),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFieldRadius,),
                // Password
                Obx(() =>  TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value)=>TValidator.validatePassword(value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      labelText: TTextStrings.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye)),
                    ))),
                const SizedBox(height: TSizes.spaceBtwSections,),

                SizedBox(width: double.infinity,child: ElevatedButton(
                  onPressed: ()=>controller.reAuthenticateWithEmailAndPasswordUser(),
                  child: const Text("Verify"),
                ),)




              ],
            ),
          ),
        ),
      ),
    );
  }
}
