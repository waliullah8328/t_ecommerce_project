import 'package:flutter/material.dart';

class TFirebaseAuthExceptions implements Exception{
  final String code;

  TFirebaseAuthExceptions({required this.code});


  String get message{
    switch(code){


      case "email-already-in use":
        return "The email address is already registered, Please use a different email";
      case "invalid-email":
        return "The email address provided is invalid, Please enter a valid email";
      case "weak-password":
        return "The password is too weak, Please chose a stronger password";
      case "user-disabled":
        return "This user account has been disabled, Please contact support for assistance";
      case "user-not-found":
        return "Invalid login details. User not found";
      case "wrong-password":
        return "Incorrect password. Please check your password and try again";
      case "invalid-verification-code":
        return "Invalid verification code. Please enter a valid code";
      case "invalid-verification-id":
        return "Invalid verification ID. Please request a new verification code";
      case "quota-exceeded":
        return "Quota exceeded. Please try again later";
      case "email-already-exists":
        return "The email address already exits. Please use a different email";
      case "provider-already-linked":
        return "The account is already linked with another provider";
      case "requires-recent-login":
        return "This operation is sensitive and requires recent authentication. Please login again";
      case "credential-already-in-use":
        return "This credential is already associated with a different user account";
      case "user-mismatch":
        return "The supplied credential do not correspond to the previously signed in user.";
      case "account-exits-with-different-credential":
        return "An account already exits with the same email but different sign in credential.";
      case "operation-not-allowed":
        return "This operation is not allowed. Contact support for assistance.";
      case "expired-action-code":
        return "The action code has expired. Please request a new action code";
      case "invalid-action-code":
        return "The action code is invalid. Please check the code and try again";
      case "missing-action-code":
        return "The action code is missing. Please provide a valid action code";
      case "user-token-expired":
        return "The user token has expired and authentication is required. Please sign in again.";
      case "invalid-credential":
        return "The supplied credential is malformed or has expired.";
      case "user-token-revoked":
        return "The user token has been revoked. Please sign in again.";
      case "invalid-message-payload":
        return "The email template verification message payload is invalid";
      case "invalid-sender":
        return "The email template sender is invalid. Please verify sender email.";
      case "invalid-recipient-email":
        return "The recipient email address is invalid. Please provide a valid recipient email";
      case "missing-iframe-start":
        return "The email template is missing the iframe start tag";
      case "missing-iframe-end":
        return "The email template is missing the iframe end tag";
      case "missing-iframe-src":
        return "The email template is missing the iframe src attribute";
      case "auth-domain-config-required":
        return "The auth domain configuration is required action code verification link.";
      case "missing-app-credential":
        return "The app credential is missing. Please provide valid app credential";
      case "session-cookie-expired":
        return "The firebase session cookie has been expired. Please sign in again";
      case "uid-already-exits":
        return "The provide user ID is already in use by another user.";
      case "invalid-cordova-configuration":
        return "The provided Cordova configuration is invalid";
      case "app-deleted":
        return "This instance of FirebaseApp has been deleted";
      case "user-token-mismatch":
        return "The provided user's token has a mismatch with the authenticated user's user ID.";
      case "web-storage-unsupported":
        return "Web storage is not supported or is disabled";
      case "app-not-authorized":
        return "The app is not authorized to use Firebase Authentication with the provided API key.";
      case "keychain-error":
        return "A keychain error is occurred. Please check the keychain and try again";
      case "internal-error":
        return "An internal authentication error occurred. Please try again later";
      default:
        return "An unexpected authentication error occurred. Please try again";



    }
  }

}