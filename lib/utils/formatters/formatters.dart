import 'package:intl/intl.dart';

class TFormatter{

static String formatDate(DateTime? date){
  date??= DateTime.now();
  return DateFormat("dd-MMM-yyyy").format(date);
}

static String formatCurrency(double amount){
  return NumberFormat.currency(locale: "en_US",symbol: "\$").format(amount);
}

static String formatPhoneNumber(String phoneNumber){
  // Assuming  10 digit phone number Us phone number format (123) 456-7890
  if(phoneNumber.length == 10){
    return "(${phoneNumber.substring(0,3)}) (${phoneNumber.substring(3,6)}) (${phoneNumber.substring(6)})";
  }
  else if(phoneNumber.length == 11){
    return "(${phoneNumber.substring(0,4)}) (${phoneNumber.substring(4,7)}) (${phoneNumber.substring(7)})";
  }
  return phoneNumber;
}

// Not fully tested
 static String internationalformatPhoneNumber(String phoneNumber){
  // Remove any non digit character from phone number

   var digitOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

   // Extract the country code from the digit only
   String countryCode = '+${digitOnly.substring(0,2)}';
   digitOnly = digitOnly.substring(2);

   // Add the remaining digit with proper formatting
   final formattedNumber = StringBuffer();
   formattedNumber.write('($countryCode)');


   int i = 0;
   while(i<digitOnly.length){
     int groupLength = 2;
     if(i==0 && countryCode == '+1'){
       groupLength = 3;
     }

     int end = i+ groupLength;
     formattedNumber.write(digitOnly.substring(i,end));
     if(end < digitOnly.length){
       formattedNumber.write(' ');
     }
     i=end;

   }
   return digitOnly;


 }



}