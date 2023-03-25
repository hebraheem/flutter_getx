import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
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
                    Get.toNamed(Routes.initial);
                  },
                  child: const IconWidget(
                    icon: Icons.home,
                    color: Colors.white,
                    backgroundColor: AppColor.mainColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.cart);
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
                child: ListView.builder(
                    itemCount: productController.allCartItems.length,
                    itemBuilder: (_, index) {
                      var product = productController.allCartItems[index];
                      var price = product.price! * product.quantity!;
                      return Container(
                        height: Dimensions.height20 * 5,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.width20 * 5,
                              height: Dimensions.height20 * 5,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.width20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      Utils.buildImagePath(product.img!),
                                    ),
                                  )),
                            ),
                            SizedBox(width: Dimensions.width10),
                            Expanded(
                              child: SizedBox(
                                width: Dimensions.width20 * 5,
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                productController
                                                    .setQuantity(false);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: AppColor.signColor,
                                              ),
                                            ),
                                            SizedBox(width: Dimensions.width10),
                                            BigText(
                                              text: product.quantity.toString(),
                                            ),
                                            SizedBox(width: Dimensions.width10),
                                            GestureDetector(
                                              onTap: () {
                                                productController
                                                    .setQuantity(true);
                                              },
                                              child: const Icon(Icons.add,
                                                  color: AppColor.signColor),
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
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
