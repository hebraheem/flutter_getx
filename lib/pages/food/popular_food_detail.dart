import 'package:flutter/material.dart';
import 'package:get_x/utils/colors.dart';
import 'package:get_x/utils/dimensions.dart';
import 'package:get_x/widgets/icon_widget.dart';
import 'package:get_x/widgets/info_card.dart';
import 'package:get_x/widgets/test_widgets.dart';

import '../../widgets/expandable_description_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: Dimensions.height20 * 6,
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              right: Dimensions.width20,
              left: Dimensions.width20),
          decoration: BoxDecoration(
            color: AppColor.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.width20 * 2),
              topRight: Radius.circular(Dimensions.width20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.width20)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.remove,
                      color: AppColor.signColor,
                    ),
                    SizedBox(width: Dimensions.width10),
                    BigText(text: "0"),
                    SizedBox(width: Dimensions.width10),
                    const Icon(Icons.add, color: AppColor.signColor),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.width20 * 2)),
                child: BigText(text: "\$10 | Add to cart", color: Colors.white),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            // background section
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
            // icon section
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
              ),
            ),
            // name /intro
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: (Dimensions.height20 * 14) +
                  Dimensions.height10 -
                  Dimensions.height30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.width20),
                          topLeft: Radius.circular(Dimensions.width20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InfoCard(text: "Chinese slide"),
                        SizedBox(height: Dimensions.height20),
                        BigText(text: "Introduction"),
                        const ExpandableDescriptionText(
                            text:
                                "In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package."),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
