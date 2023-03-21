import 'package:flutter/material.dart';
import 'package:get_x/utils/colors.dart';
import 'package:get_x/utils/dimensions.dart';
import 'package:get_x/widgets/expandable_description_text.dart';
import 'package:get_x/widgets/icon_widget.dart';
import 'package:get_x/widgets/test_widgets.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          toolbarHeight: Dimensions.height20 * 4,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              IconWidget(
                icon: Icons.clear,
              ),
              IconWidget(
                icon: Icons.shopping_cart_outlined,
              )
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Dimensions.height20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height20),
                    topRight: Radius.circular(Dimensions.height20)),
              ),
              width: double.maxFinite,
              padding: EdgeInsets.only(
                  top: Dimensions.height10, bottom: Dimensions.height10),
              child: Center(
                  child: BigText(
                size: Dimensions.font16 + Dimensions.font10,
                text: "Chinese slides",
              )),
            ),
          ),
          pinned: true,
          backgroundColor: AppColor.mainColor,
          expandedHeight: Dimensions.height30 * 10,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/image/image2.jpeg',
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              child: Column(
                children: const [
                  ExpandableDescriptionText(
                      text:
                          "In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline. For this purpose, use the cached_network_image package. In some cases, it’s handy to cache images as they’re downloaded from the web, so they can be used offline.")
                ],
              )),
        )
      ]),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.width10 * 3,
            right: Dimensions.width10 * 3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconWidget(
                icon: Icons.remove,
                color: Colors.white,
                backgroundColor: AppColor.mainColor,
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.width20 * 2)),
                child: BigText(
                    size: Dimensions.font16 + Dimensions.font10,
                    text: "\$10.88 * 2"),
              ),
              const IconWidget(
                icon: Icons.add,
                color: Colors.white,
                backgroundColor: AppColor.mainColor,
              ),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            top: Dimensions.height20,
            bottom: Dimensions.height20,
            left: Dimensions.width10 * 3,
            right: Dimensions.width10 * 3,
          ),
          decoration: BoxDecoration(
            color: AppColor.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.width30),
              topRight: Radius.circular(Dimensions.width30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Dimensions.width30 * 1.5,
                height: Dimensions.height30 * 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.width10),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: AppColor.mainColor,
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
      ]),
    );
  }
}
