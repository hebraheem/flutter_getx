import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/cart_controller.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
import 'package:get_x/utils/colors.dart';
import 'package:get_x/utils/dimensions.dart';
import 'package:get_x/widgets/icon_widget.dart';
import 'package:get_x/widgets/info_card.dart';
import 'package:get_x/widgets/test_widgets.dart';

import '../../routes/route.dart';
import '../../utils/helpers.dart';
import '../../widgets/expandable_description_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({required this.pageId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<PopularProductController>();
    final product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.width20)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setQuantity(false);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: AppColor.signColor,
                          ),
                        ),
                        SizedBox(width: Dimensions.width10),
                        BigText(text: controller.inCartItems.toString()),
                        SizedBox(width: Dimensions.width10),
                        GestureDetector(
                            onTap: () {
                              controller.setQuantity(true);
                            },
                            child: const Icon(Icons.add,
                                color: AppColor.signColor)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.height20),
                    decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.width20 * 2)),
                    child: GestureDetector(
                      onTap: () {
                        productController.addItem(product);
                      },
                      child: BigText(
                          text: "\$${product.price!} | Add to cart",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(Utils.buildImagePath(product.img!)),
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
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getInitial());
                    },
                    child: const IconWidget(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  GetBuilder<PopularProductController>(builder: (cart) {
                    final totalItemsInCart = cart.totalItems;

                    return GestureDetector(
                      onTap: () {},
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
                        InfoCard(text: product.name!),
                        SizedBox(height: Dimensions.height20),
                        BigText(text: "Introduction"),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Dimensions.height5,
                              bottom: Dimensions.height5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: Dimensions.height30 * 10,
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: ExpandableDescriptionText(
                                        text: product.description!),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
