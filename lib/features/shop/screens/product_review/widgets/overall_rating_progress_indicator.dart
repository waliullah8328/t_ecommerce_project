import 'package:flutter/material.dart';
import 'package:t_ecommerce_project/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';


class TOverallProductReview extends StatelessWidget {
  const TOverallProductReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [

      Expanded(
          flex: 3,
          child: Text("4.7",style: Theme.of(context).textTheme.displayLarge,)),
      const Expanded(
        flex: 7,
        child: Column(children: [
          TRatingProgressIndicator(text: "5",value: 1.0,),
          TRatingProgressIndicator(text: "4",value: 0.8,),
          TRatingProgressIndicator(text: "3",value: 0.6,),
          TRatingProgressIndicator(text: "2",value: 0.4,),
          TRatingProgressIndicator(text: "1",value: 0.2,),

        ],),
      ),

    ],);
  }
}