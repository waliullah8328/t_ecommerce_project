

class TValidator{

  // Empty test validation
  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateEmail(String? value){

    if(value == null || value.isEmpty){
      return "Email is required";

    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2-4}$');
    if(emailRegExp.hasMatch(value)){
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return "Password is required";

    }

    // Check for minimum password length
    if(value.length < 6){
      return "Password must be at least 6 character long..";
    }
    // Check uppercase letter
    if(!value.contains(RegExp(r'[A-Z]'))){
      return "Password must contain at least one UpperCase letter";
    }

    // Check number
    if(!value.contains(RegExp(r'[0-9]'))){
      return "Password must contain at least one number";
    }

    // Check for special character
    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return "Password must contain at least one special character";
    }
    return null;


  }


  // Regular expression for phone number

  static String? validatePhoneNumber(String? value){
    if(value == null || value.isEmpty){
      return "Phone Number is required";

    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    
    if(!phoneRegExp.hasMatch(value)){
      return "Invalid Phone Number format (10 digit required)";
    }
    return null;

  }


}