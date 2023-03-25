import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/cart_controller.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
import 'package:get_x/controllers/recommended_product_controller.dart';
import 'package:get_x/utils/colors.dart';
import 'package:get_x/utils/dimensions.dart';
import 'package:get_x/utils/helpers.dart';
import 'package:get_x/widgets/icon_widget.dart';
import 'package:get_x/widgets/test_widgets.dart';

import '../../routes/route.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<PopularProductController>();

    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartInstance) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                      width: Dimensions.width20 * 5,
                      height: Dimensions.height30 * 1.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.width10),
                      ),
                      child: Center(
                        child: BigText(
                          text: "\$${cartInstance.totalPrice.toString()}",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.width20 * 2)),
                        child: BigText(text: "Checkout", color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height30 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.offNamed();
                  },
                  child: const IconWidget(
                    icon: Icons.arrow_back,
                    color: Colors.white,
                    backgroundColor: AppColor.mainColor,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.getInitial());
                  },
                  child: const IconWidget(
                    icon: Icons.home,
                    color: Colors.white,
                    backgroundColor: AppColor.mainColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.getCartPage());
                  },
                  child: const IconWidget(
                    icon: Icons.shopping_cart,
                    color: Colors.white,
                    backgroundColor: AppColor.mainColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (controller) {
                    return ListView.builder(
                        itemCount: productController.allCartItems.length,
                        itemBuilder: (_, index) {
                          var product = productController.allCartItems[index];
                          var price = product.price! * product.quantity!;
                          return Container(
                            height: Dimensions.height20 * 5,
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height10),
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(
                                              product.product,
                                            );
                                    var recommendedIndex =
                                        Get.find<RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(
                                              product.product,
                                            );
                                    if (popularIndex >= 0) {
                                      Get.toNamed(
                                        Routes.getPopularFoodDetailPage(
                                            popularIndex, "cart"),
                                      );
                                    }
                                    if (recommendedIndex >= 0) {
                                      Get.toNamed(
                                        Routes.getRecommendedFoodDetailPage(
                                            recommendedIndex, "cart"),
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.width20 * 5,
                                    height: Dimensions.height20 * 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.width20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            Utils.buildImagePath(product.img!),
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10),
                                Expanded(
                                  child: SizedBox(
                                    width: Dimensions.width20 * 5,
                                    height: Dimensions.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: product.name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: "spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              color: Colors.redAccent,
                                              text: "\$${price.toString()}",
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.addItemToCart(
                                                      -1,
                                                      product.product!,
                                                      productController
                                                          .inCartItems,
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: Dimensions.width10),
                                                BigText(
                                                  text: product.quantity
                                                      .toString(),
                                                ),
                                                SizedBox(
                                                    width: Dimensions.width10),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.addItemToCart(
                                                      1,
                                                      product.product!,
                                                      productController
                                                          .inCartItems,
                                                    );
                                                  },
                                                  child: const Icon(Icons.add,
                                                      color:
                                                          AppColor.signColor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  })),
            ),
          )
        ],
      ),
    );
  }
}
