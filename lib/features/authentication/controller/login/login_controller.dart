import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_ecommerce_project/features/authentication/models/user_model.dart';
import 'package:t_ecommerce_project/features/personalization/controllers/user_controller.dart';

import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../data/repositories/user_repository/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/exception/TAuthExceptions.dart';
import '../../../../utils/exception/T_platform_exception.dart';
import '../../../../utils/exception/t_firebase_exception.dart';
import '../../../../utils/exception/t_format_exception.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loader.dart';

class LoginController extends GetxController{



  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    // TODO: implement onInit

    //email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? '';
    //password.text = localStorage.read("REMEMBER_ME_PASSWORD" ?? '');
    super.onInit();

  }






  //-- SignIn--

  Future<void> emailAndPasswordSignIn()async{
    try{

      // Start loading
      TFullScreenLoader.openLoadingDialog("We are processing user information...", TImages.loading);

      // Check internet connectivity
      //final isConnected = NetworkManager.instance.isConnected();
      //if(!isConnected){
      //  return;
      //}

      if(!formKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      // save data when remember is selected
      if(rememberMe.value){
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Register user in the Firebase Authentication & Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());



      // Remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();

      // Show success message
     // TLoaders.successSnackBar(title: "Congratulations",message:"Your are successfully login" );







    }catch(e){
      // Show some generic Error to the user
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh snap!",message: e.toString());

    }

  }


  // Google Sign in

Future<void> googleSignIn()async{
    try{
      TFullScreenLoader.openLoadingDialog("Logging you in", TImages.loading);

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove the loader
      TFullScreenLoader.stopLoading();

     // Redirect
      AuthenticationRepository.instance.screenRedirect();


    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthExceptions(code: e.code).message;
    }
    on FirebaseException catch(e){
      throw TFirebaseException(code: e.code).message;
    }
    on FormatException catch(_){
      throw TFormatException();
    }
    on PlatformException catch(e){
      throw TPlatformException(code: e.code).message;
    }
    catch(e){
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());

    }


}





}