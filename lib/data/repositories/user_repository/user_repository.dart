import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_ecommerce_project/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:t_ecommerce_project/features/authentication/models/user_model.dart';

import '../../../utils/exception/TAuthExceptions.dart';
import '../../../utils/exception/T_platform_exception.dart';
import '../../../utils/exception/t_firebase_exception.dart';
import '../../../utils/exception/t_format_exception.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;



  // Function to save user data

  Future<void> storeUserRecord(UserModel user)async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());

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


  // Function to fetch user details based on your user ID

  Future<UserModel>fetchUserDetails()async{
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }

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

  // Function to update user data n firestore
  Future<void> updateUserDetails(UserModel updatedUser)async{
    try{
      await _db.collection("Users").doc(updatedUser.id).set(updatedUser.toJson());

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

  // Update any field in specific users collection
  Future<void> updateSingleField(Map<String,dynamic> json)async{
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);

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

  // Function to remove the data from firestore
  Future<void> removeUserRecord(String userID)async{
    try{
      await _db.collection("Users").doc(userID).delete();

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


  // Upload any image
  Future<String> uploadImage (String path, XFile image)async{
    try{

      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;


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