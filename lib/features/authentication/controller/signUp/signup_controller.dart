

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:t_ecommerce_project/data/repositories/user_repository/user_repository.dart';
import 'package:t_ecommerce_project/features/authentication/models/user_model.dart';
import 'package:t_ecommerce_project/utils/constants/image_strings.dart';
import 'package:t_ecommerce_project/utils/network/network_manager.dart';
import 'package:t_ecommerce_project/utils/popups/full_screen_loader.dart';
import 'package:t_ecommerce_project/utils/popups/loader.dart';

import '../../screens/signUp/varify_email/varify_email.dart';

class SignUpController extends GetxController{
static SignUpController get instance => Get.find();


// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

//-- SignUp--

Future<void> signUp()async{
  try{

    // Start loading
    TFullScreenLoader.openLoadingDialog("We are processing user information...", TImages.loading);

    // Check internet connectivity
    //final isConnected = NetworkManager.instance.isConnected();
    //if(!isConnected){
    //  return;
    //}

    if(!signupFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;
    }


    // Privacy Policy check
    if(!privacyPolicy.value){

      TLoaders.warningSnackBar(title: "Accept Privacy Policy",
          message: "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use");
      TFullScreenLoader.stopLoading();
      return;
    }

    // Register user in the Firebase Authentication & Save user data in the firebase
    final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    // Save authenticated user data in the firebase firestore
    final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: ""
    );
    final userRepository = Get.put(UserRepository());
    await userRepository.storeUserRecord(newUser);

    // Remove loader
    TFullScreenLoader.stopLoading();

    // Show success message
    TLoaders.successSnackBar(title: "Congratulations",message:"Your account has been created! Verify email to continue" );



    
    // Move to verify screen
    Get.to(()=> VerifyEmail(email: email.text.trim(),));


  }catch(e){
    // Show some generic Error to the user
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: "Oh snap!",message: e.toString());

  }

}




}