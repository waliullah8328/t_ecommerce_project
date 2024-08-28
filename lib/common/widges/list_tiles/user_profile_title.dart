import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_ecommerce_project/features/personalization/controllers/user_controller.dart';

import '../../../features/personalization/screens/profile/profile.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../loaders/simmer.dart';
import '../images/t_circular_image.dart';


class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading: //const TCircularImage(image: TImages.uniformIcon,width: 50,height: 50,padding: 0,)
      Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty? networkImage: TImages.user1;
        return controller.imageUploading.value?
        const TSimmerEffect(width: 50,height: 50,radius: 50,) :
        TCircularImage(image: image,width: 50,height: 50,isNetworkImage: networkImage.isNotEmpty,);
      }),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: ()=>Get.to(()=> const ProfileScreen()), icon: const Icon(Iconsax.edit,color: TColors.white,)),
    );
  }
}