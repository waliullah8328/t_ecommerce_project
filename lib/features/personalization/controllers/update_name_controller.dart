import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/data/repositories/user_repository/user_repository.dart';
import 'package:t_ecommerce_project/features/personalization/controllers/user_controller.dart';
import 'package:t_ecommerce_project/features/personalization/screens/profile/profile.dart';
import 'package:t_ecommerce_project/utils/constants/image_strings.dart';
import 'package:t_ecommerce_project/utils/popups/full_screen_loader.dart';
import 'package:t_ecommerce_project/utils/popups/loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedName();
    super.onInit();
  }

  // Fetch user record and initialize text fields

  Future<void> initializedName() async {
    final user = userController.user.value;
    if (user != null) {
      firstName.text = user.firstName ?? '';
      lastName.text = user.lastName ?? '';
    }
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.loading);

      if (!updateNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user first & last name in the Firebase Firestore
      Map<String, dynamic> name = {"firstName": firstName.text.trim(), "lastName": lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Safely update user data in the UserController
      userController.user.update((user) {
        if (user != null) {
          user.firstName = firstName.text.trim();
          user.lastName = lastName.text.trim();
        }
      });

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Congratulations", message: "Your name has been updated");
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}