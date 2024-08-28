

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String name;
  String id;
  String image;
  String parentID;
  bool isFeatured;

  CategoryModel({
    required this.name,
    required this.id,
    required this.image,
    this.parentID = "",
    required this.isFeatured,
});


  // Empty Helper function
  static CategoryModel empty()=> CategoryModel(name: "", id: "", image: "", parentID: "", isFeatured: false,);


  // Convert model to Json structure that you can store data inFirebase
 Map<String,dynamic> toJson(){
  return {
    "Name":name,
    "Image": image,
    "ParentID":parentID,
    "IsFeatured":isFeatured

  };
}

  // Map Json oriented document snapshot from firebase to userModel
factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
   if(document.data()!= null){
     final data = document.data()!;

     // Map Json Record to the model
   return CategoryModel(
     name: data["Name"]??'',
     id: document.id,
  image: data["Image"]??'',
  parentID: data["ParentID"]??'',
  isFeatured: data["IsFeatured"]??false
  );

  }
  else{
    return CategoryModel.empty();
  }


  }


}