import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:t_ecommerce_project/features/authentication/screens/password_configaration/reset_password.dart';
import 'package:t_ecommerce_project/utils/popups/loader.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
   static ForgetPasswordController get instance => Get.find();

  // Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordResetFormKey = GlobalKey<FormState>();

  // Sent reset password email
  sendPasswordResetEmail()async{
    try{
      TFullScreenLoader.openLoadingDialog("Logging you in", TImages.loading);


      // Form Validation

      if(!forgetPasswordResetFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;

      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove the loader
      TFullScreenLoader.stopLoading();

      // Show the success screen
      TLoaders.successSnackBar(title: "Email Sent",message: "Email link Sent to Reset your Password".tr);

      // Redirect
      Get.to(()=> ResetPasswordScreen(email: email.text.trim(),));

    }catch(e){
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());

    }

  }

  resendPasswordResetEmail(String email) async {
    try{
      TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.loading);


      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove the loader
      TFullScreenLoader.stopLoading();

      // Show the success screen
      TLoaders.successSnackBar(title: "Email Sent",message: "Email link Sent to Reset your Password".tr);



    }catch(e){
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());

    }

  }

}