

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_ecommerce_project/data/repositories/user_repository/user_repository.dart';
import 'package:t_ecommerce_project/features/authentication/screens/signUp/varify_email/varify_email.dart';
import 'package:t_ecommerce_project/navigation_menu.dart';
import 'package:t_ecommerce_project/utils/exception/TAuthExceptions.dart';
import 'package:t_ecommerce_project/utils/exception/T_platform_exception.dart';
import 'package:t_ecommerce_project/utils/exception/t_firebase_exception.dart';
import 'package:t_ecommerce_project/utils/exception/t_format_exception.dart';

import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/onBoarding/onboarding_screen.dart';


class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // variables

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authentication user data
  User? get authUser => _auth.currentUser;

  // call for main.dart app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  // Function to show relevant screen
  void screenRedirect() async{
    final user = _auth.currentUser;

    if(user!= null){
      if(user.emailVerified){
        Get.offAll(()=>const NavigationMenu());
      }
      else{
        Get.offAll(()=> VerifyEmail(email: _auth.currentUser?.email,));
      }
    }
    else{
      if(kDebugMode){
        print("====================GetStorage================");
        print(deviceStorage.read("isFirstTime"));
      }
      // Local storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime")!= true? Get.offAll(()=>const LoginScreen()): Get.offAll(()=>const OnboardingScreen());

    }




  }




  // -------------------------------- Email and Password Sign In -------------------------------------------

  // Google sign in login
  Future<UserCredential> signInWithGoogle() async {
    try{
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken

      );
      return await _auth.signInWithCredential(credentials);

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
      throw "Some thing went wrong, Please try again";

    }



  }

  // Email Authentication login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);

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
      throw "Some thing went wrong, Please try again";

    }



  }


 // Email Authentication Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);

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
      throw "Some thing went wrong, Please try again";

    }



  }


  // Email verification
  Future<void> sendEmailVerification()async{
    try{
      await _auth.currentUser?.sendEmailVerification();

    }on FirebaseAuthException catch(e){
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
      throw "Some thing went wrong, Please try again";

    }

  }

  // Email verification
  Future<void> sendPasswordResetEmail(String email)async{
    try{
      await _auth.sendPasswordResetEmail(email: email);

    }on FirebaseAuthException catch(e){
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
      throw "Some thing went wrong, Please try again";

    }

  }




  // Log out Function
  Future<void> logout()async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());

    }on FirebaseAuthException catch(e){
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
      throw "Some thing went wrong, Please try again";

    }

  }

  // Delete Account Function
  Future<void> deleteAccount()async{
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();


    }on FirebaseAuthException catch(e){
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
      throw "Some thing went wrong, Please try again";

    }

  }

  // Re Authenticate user
  Future<void> reAuthenticateUserWithEmailAndPassword(String email,String password)async{
    try{
      // Create credentials
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // Re Authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);


    }on FirebaseAuthException catch(e){
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
      throw "Some thing went wrong, Please try again";

    }

  }




}