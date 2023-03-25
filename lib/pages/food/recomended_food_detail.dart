import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
import 'package:get_x/utils/colors.dart';
import 'package:get_x/utils/dimensions.dart';
import 'package:get_x/widgets/expandable_description_text.dart';
import 'package:get_x/widgets/icon_widget.dart';
import 'package:get_x/widgets/test_widgets.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route.dart';
import '../../utils/helpers.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: Dimensions.height20 * 4,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (page == "cart") {
                    Get.toNamed(Routes.getCartPage());
                  } else {
                    Get.toNamed(Routes.getInitial());
                  }
                },
                child: const IconWidget(
                  icon: Icons.clear,
                ),
              ),
              GetBuilder<PopularProductController>(builder: (cart) {
                final totalItemsInCart = cart.totalItems;

                return GestureDetector(
                  onTap: () {
                    if (totalItemsInCart < 1) return;
                    Get.toNamed(Routes.getCartPage());
                  },
                  child: Stack(
                    children: [
                      const IconWidget(
                        icon: Icons.shopping_cart_outlined,
                      ),
                      totalItemsInCart >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: IconWidget(
                                icon: Icons.circle,
                                size: Dimensions.width20,
                                color: Colors.transparent,
                                backgroundColor: AppColor.mainColor,
                              ),
                            )
                          : Container(),
                      totalItemsInCart >= 1
                          ? Positioned(
                              right: Dimensions.width10 / 2,
                              child: BigText(
                                size: Dimensions.font16,
                                color: Colors.white,
                                text: totalItemsInCart.toString(),
                              ),
                            )
                          : Container()
                    ],
                  ),
                );
              })
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
                text: product.name,
              )),
            ),
          ),
          pinned: true,
          backgroundColor: AppColor.mainColor,
          expandedHeight: Dimensions.height30 * 10,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              Utils.buildImagePath(product.img),
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
                children: [
                  ExpandableDescriptionText(text: product.description)
                ],
              )),
        )
      ]),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (productInstance) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width10 * 3,
                  right: Dimensions.width10 * 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        productInstance.setQuantity(false);
                      },
                      child: const IconWidget(
                        icon: Icons.remove,
                        color: Colors.white,
                        backgroundColor: AppColor.mainColor,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.width20 * 2)),
                      child: BigText(
                          size: Dimensions.font16 + Dimensions.font10,
                          text:
                              "\$${product.price} * ${productInstance.inCartItems}"),
                    ),
                    GestureDetector(
                      onTap: () {
                        productInstance.setQuantity(true);
                      },
                      child: const IconWidget(
                        icon: Icons.add,
                        color: Colors.white,
                        backgroundColor: AppColor.mainColor,
                      ),
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
                    GestureDetector(
                      onTap: () {
                        productInstance.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.width20 * 2)),
                        child: BigText(
                            text: "\$10 | Add to cart", color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
