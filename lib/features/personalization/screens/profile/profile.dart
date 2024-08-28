import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:t_ecommerce_project/features/personalization/controllers/user_controller.dart';
import 'package:t_ecommerce_project/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_ecommerce_project/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../common/loaders/simmer.dart';
import '../../../../common/widges/images/t_circular_image.dart';
import '../../../../common/widges/text/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return  Scaffold(
      appBar: const TAppBar(title:Text("Profile"),showBackArrow: true,),

      body: SingleChildScrollView(
        child:  Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                     Obx(() {
                       final networkImage = controller.user.value.profilePicture;
                       final image = networkImage.isNotEmpty? networkImage: TImages.user1;
                       return controller.imageUploading.value?
                       const TSimmerEffect(width: 80,height: 80,radius: 80,) :
                       TCircularImage(image: image,width: 80,height: 80,isNetworkImage: networkImage.isNotEmpty,);
                     }),

                    TextButton(onPressed: ()=>controller.uploadImageProfile(), child: const Text("Change Profile Picture"))

                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const TSectionHeading(title: "Profile Information",showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),


              ProfileMenu(title: 'Name',value: controller.user.value.fullName,onPress: ()=>Get.to(()=> const ChangeName())),
              const SizedBox(height: TSizes.spaceBtwItems/2.5,),
              ProfileMenu(title: 'User name',value: controller.user.value.userName,onPress: (){},),

              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              // Heading Personal Info
              const TSectionHeading(title: "Personal Information",showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'User ID',value: controller.user.value.id,onPress: (){},icon: Iconsax.copy,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              ProfileMenu(title: 'Email',value: controller.user.value.email,onPress: (){},),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              ProfileMenu(title: 'Phone',value: controller.user.value.phoneNumber,onPress: (){},),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              ProfileMenu(title: 'Gender',value: "Male",onPress: (){},),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              ProfileMenu(title: 'Date of Birth',value: "15 December, 2002",onPress: (){},),
              const SizedBox(height: TSizes.spaceBtwItems/2,),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              Center(child: TextButton(onPressed: ()=>controller.deleteAccountWarningPopup(), child: const Text("Close Account",style: TextStyle(color: Colors.red),)))




            ],
          ),

        ),
      ),
    );
  }
}


