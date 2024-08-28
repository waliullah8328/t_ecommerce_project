import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/common/loaders/animation_loader.dart';
import 'package:t_ecommerce_project/utils/helpers/helper_function.dart';

import '../constants/colors.dart';

class TFullScreenLoader{

  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!,// Use Get.overlayContext for overlay dialog
        barrierDismissible: false, // The dialog can not be dismiss by trapping out side it.
        builder: (_)=> PopScope(
          canPop: false,  // Disable popping with the back button
            child: Container(
              color: THelperFunction.isDarkMode(Get.context!)? TColors.dark: TColors.white,
              width: double.infinity,
              height: double.infinity,
              child:Column(
                children: [
                  const SizedBox(height: 250,),
                  TAnimationLoaderWidget(text: text, animation: animation),
                ],
              ) ,
            )
        ),
    );
  }



  // For stop loading

  static void stopLoading(){
    
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using navigator


  }


  
}