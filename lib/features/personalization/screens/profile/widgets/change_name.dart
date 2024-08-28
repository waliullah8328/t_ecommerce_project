import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/common/appbar/appbar.dart';
import 'package:t_ecommerce_project/features/personalization/controllers/update_name_controller.dart';
import 'package:t_ecommerce_project/utils/constants/sizes.dart';
import 'package:t_ecommerce_project/utils/constants/text_strings.dart';
import 'package:t_ecommerce_project/utils/validators/validator.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        title: Text("Change Name",style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Headlines
            Text("Use real name for easy verification.This name will appear on several pages",style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Form field and button
            Form(
              key: controller.updateNameFormKey,
                child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  expands: false,
                  validator: (value)=> TValidator.validateEmptyText("First Name", value),
                  decoration: InputDecoration(labelText: TTextStrings.firstName,prefixIcon: Icon(Iconsax.user)),
                ),

                const SizedBox(height: TSizes.spaceBtwItems,),

                TextFormField(
                  controller: controller.lastName,
                  expands: false,
                  validator: (value)=> TValidator.validateEmptyText("Last Name", value),
                  decoration: InputDecoration(labelText: TTextStrings.lastName,prefixIcon: Icon(Iconsax.user)),
                ),



              ],
            )),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Save button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.updateUserName(), child:const Text("Save")),),



          ],
        ),
      ),


    );
  }
}
