import 'package:flutter/material.dart';
import 'package:get_x/utils/dimensions.dart';
import 'package:get_x/widgets/icon_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: (Dimensions.height20 * 14) + Dimensions.height10,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/image3.jpeg'),
              fit: BoxFit.cover,
            )),
          ),
        ),
        Positioned(
            top: (Dimensions.height20 * 2) + Dimensions.height5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IconWidget(
                  icon: Icons.arrow_back_ios,
                ),
                IconWidget(
                  icon: Icons.shopping_cart_outlined,
                )
              ],
            ))
      ],
    ));
  }
}
