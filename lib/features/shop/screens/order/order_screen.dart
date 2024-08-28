import 'package:flutter/material.dart';
import 'package:t_ecommerce_project/features/shop/screens/order/widgets/order_list.dart';

import '../../../../common/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("My Orders",style: Theme.of(context).textTheme.headlineMedium,),showBackArrow: true,),

      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        // Oders
        child: TOrdersItems(),
      ),
    );
  }
}
