import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_ecommerce_project/common/loaders/t_category_shimmer.dart';

import '../../../../../common/widges/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/category_controller.dart';
import '../../sub_catergory/sub_category_screen.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx((){

      if(categoryController.isLoading.value )return const TCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text("No data found",style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(image: category.image,title: category.name,onPress: ()=> Get.to(()=>const SubCategoryScreen()),);
          },
        ),
      );
    });
  }
}