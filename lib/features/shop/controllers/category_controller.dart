import 'package:get/get.dart';
import 'package:t_ecommerce_project/data/repositories/category_repository/categories_repository.dart';
import 'package:t_ecommerce_project/utils/popups/loader.dart';

import '../models/category_models.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories =<CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories =<CategoryModel>[].obs;


  @override
  void onInit() {

    fetchCategories();
    super.onInit();
  }


  // Load category data
  Future<void> fetchCategories() async{
    try{

      // Show loader while loading category
      isLoading.value = true;

      // Fetch category from data source (Firestore,API,etc)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);


      // Filter the featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentID.isEmpty).take(8).toList());


    }
    catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }finally{
      // Remove loader
      isLoading.value = false;

    }



  }




  // Load selected category data


  // Get category or Sub category product


}