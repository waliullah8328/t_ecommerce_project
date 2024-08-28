import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/common/widges/success_screen/success_screen.dart';
import 'package:t_ecommerce_project/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:t_ecommerce_project/utils/constants/image_strings.dart';
import 'package:t_ecommerce_project/utils/constants/text_strings.dart';
import 'package:t_ecommerce_project/utils/popups/loader.dart';

class VerifyEmailController extends GetxController{

  static VerifyEmailController get instance => Get.find();


  // Send email whenever verify email screen appears & Set timer for auto redirect
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendEmailVerification();
    setTimerToAutoRedirect();
  }


  // Send email verification link
  void sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email Sent",message: "Please check your inbox and verify your email");

    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }


  // Timer to auto metically redirect on Email
  void setTimerToAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified?? false){
        timer.cancel();
        Get.off(()=>  SuccessScreen(
            image: TImages.success,
            title: TTextStrings.yourAccountCreatedTitle,
            subtitle: TTextStrings.yourAccountCreatedSubTitle,
          onPress: ()=> AuthenticationRepository.instance.screenRedirect(),
        ));

      }
    });
  }




  // Manually check if Email is verified

  checkEmailVerificationStatus(){
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser!= null && currentUser.emailVerified){
      Get.off(()=>  SuccessScreen(
        image: TImages.success,
        title: TTextStrings.yourAccountCreatedTitle,
        subtitle: TTextStrings.yourAccountCreatedSubTitle,
        onPress: ()=> AuthenticationRepository.instance.screenRedirect(),
      ));

    }
  }




}

