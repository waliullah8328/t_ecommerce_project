

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/features/shop/models/category_models.dart';

import '../../../utils/exception/TAuthExceptions.dart';
import '../../../utils/exception/T_platform_exception.dart';
import '../../../utils/exception/t_firebase_exception.dart';
import '../../../utils/exception/t_format_exception.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();


  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
 Future<List<CategoryModel>> getAllCategories()async{
   try{

     final snapShot = await _db.collection("Categories").get();
     final list = snapShot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
     return list;



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


  //  Get sub categories


  // Upload categories to cloud firebase




}