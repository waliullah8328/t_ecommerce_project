import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_ecommerce_project/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:t_ecommerce_project/data/repositories/user_repository/user_repository.dart';
import 'package:t_ecommerce_project/features/authentication/models/user_model.dart';
import 'package:t_ecommerce_project/features/authentication/screens/login/login_screen.dart';
import 'package:t_ecommerce_project/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:t_ecommerce_project/utils/constants/image_strings.dart';
import 'package:t_ecommerce_project/utils/constants/sizes.dart';
import 'package:t_ecommerce_project/utils/popups/full_screen_loader.dart';
import 'package:t_ecommerce_project/utils/popups/loader.dart';

class UserController extends GetxController{
  static UserController get  instance => Get.find();
  
  final userRepository = Get.put(UserRepository());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLogin = false.obs;
  GlobalKey<FormState> reAuthenticateFormKey = GlobalKey<FormState>();


  @override
  void onInit() {

    super.onInit();
    fetchUserRecord();
  }

  // Fetch User record function
  Future<void> fetchUserRecord()async{
    try{
      profileLogin.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);


    }catch(e){
      user(UserModel.empty());

    }finally{
      profileLogin.value = false;

    }

  }

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials)async{
    try{
      // Refresh user Record
      fetchUserRecord();
      if(user.value.id.isEmpty){
        if(userCredentials != null){
          // convert name to first and last name
          final nameParts = UserModel.namePart(userCredentials.user!.displayName??"");
          final userName = UserModel.generateUserName(userCredentials.user!.displayName??"");

          // Map data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length>1?nameParts.sublist(1).join(" "):'',
              userName: userName,
              email: userCredentials.user!.email??'',
              phoneNumber: userCredentials.user!.phoneNumber??'',
              profilePicture: userCredentials.user!.photoURL??''
          );

          // Save user data
          await userRepository.storeUserRecord(user);

        }

      }


    }catch(e){
      TLoaders.warningSnackBar(title: "Data not saved",
          message: "Something went wrong while saving your information.You can re-save your data in your profile",
      );
    }

  }

  // Delete account warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText: "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently",
      confirm: ElevatedButton(onPressed: ()=> deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg),child: Text("Delete"),),
      ),
      cancel: OutlinedButton(onPressed: ()=>Navigator.of(Get.overlayContext!).pop(),
          child: const Text("Cancel"))
    );

  }

 void  deleteUserAccount() async{
    try{
      TFullScreenLoader.openLoadingDialog("Processing", TImages.loading);

      // First re-authentication user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider == "google.com"){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(()=>const LoginScreen());
        }
        else if(provider == "password"){
          TFullScreenLoader.stopLoading();
          Get.offAll(()=>const ReAuthLoginForm());
          
        }
      }

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());

    }



  }

 Future<void> reAuthenticateWithEmailAndPasswordUser() async{
    try{
      TFullScreenLoader.openLoadingDialog("Processing", TImages.loading);

      if(!reAuthenticateFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateUserWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(()=>const LoginScreen());

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());

    }



  }

  uploadImageProfile() async{
    try{


      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);

      if(image!= null){
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage("Users/Images/Profile", image);

        // Update User Image Record
        Map<String,dynamic> json = {"ProfilePicture":imageUrl};

        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(title: "Congratulations",message: "Your profile has been updated!");
      }
    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: "Something went wrong: $e");
      
    }finally{
      imageUploading.value = false;
    }

  }


}

