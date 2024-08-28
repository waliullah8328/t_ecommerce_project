import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/check_box_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outline_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';


class TAppTheme{
  TAppTheme._();


  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme:TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxThemeData,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme

  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme:TElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme:  TBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: TCheckBoxTheme.darkCheckBoxThemeData,
      chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme
  );
}