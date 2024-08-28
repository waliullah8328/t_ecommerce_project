import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/utils/formatters/formatters.dart';

class UserModel{

  final String id;
  final String userName;
  final String email;

   String firstName,lastName,phoneNumber,profilePicture;

  UserModel({required this.id, required this.firstName, required this.lastName, required this.userName, required this.email, required this.phoneNumber, required this.profilePicture});

  // Helper function to get full name
  String get fullName => '$firstName $lastName';

  // Helper function to get full name
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // Helper function to split full name into first and last name
  static List<String> namePart(fullName) => fullName.split(" ");

  // Static function to generate user name
  static String generateUserName(fullName){
    List<String> namePart = fullName.split(" ");
    String firstName = namePart[0].toLowerCase();
    String lastName = namePart.length>1? namePart[1].toLowerCase():"";

    String camelCaseUserName = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;

  }

  // Static function to create an empty user Model
  static UserModel empty()=> UserModel(id: "", firstName: "", lastName: "", userName: "", email: "", phoneNumber: "", profilePicture: "");

  // Convert model to json format

  Map<String,dynamic>toJson(){
    return {
      "FirstName": firstName,
      "LastName":lastName,
      "UserName":userName,
      "Email": email,
      "PhoneNumber":phoneNumber,
      "ProfilePicture":profilePicture

    };

   }

   // Factory method to create UserModel from a firebase document
   factory UserModel.fromSnapshot(DocumentSnapshot <Map<String,dynamic>> document){
    if(document.data()!= null){
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data["FirstName"]??'',
          lastName:data["LastName"]??'',
          userName: data["UserName"]??'',
          email: data["Email"]??'',
          phoneNumber: data["PhoneNumber"]??'',
          profilePicture: data["ProfilePicture"]??''
      );
    }
    else{
      throw Exception("Document data is null");
    }

   }



}