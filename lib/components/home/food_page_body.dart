// ignore_for_file: sized_box_for_whitespace

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
import 'package:get_x/controllers/recommended_product_controller.dart';
import 'package:get_x/models/popular_product_model.dart';
import 'package:get_x/pages/food/popular_food_detail.dart';
import 'package:get_x/routes/route.dart';
import 'package:get_x/utils/colors.dart';
import 'package:get_x/widgets/icon_text.dart';
import 'package:get_x/widgets/test_widgets.dart';
import 'package:get_x/widgets/info_card.dart';
import 'package:get_x/utils/dimensions.dart';

import '../../models/recommended_product_model.dart';
import '../../utils/helpers.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.80);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainerHeight;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (pp) {
          final bool isLoading = pp.isLoading;
          return isLoading
              ? Container(
                  height: Dimensions.foodMainHeaderHeight,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: pp.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                            index, pp.popularProductList[index]);
                      }),
                )
              : const CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
        // dots section
        GetBuilder<PopularProductController>(builder: (pp) {
          return DotsIndicator(
            dotsCount: pp.popularProductList.length > 1
                ? pp.popularProductList.length
                : 1,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColor.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // popular section
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height5),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "Food paring"),
            ],
          ),
        ),
        // list view section
        GetBuilder<RecommendedProductController>(builder: (rm) {
          final bool isLoading = rm.isLoading;
          return isLoading
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: rm.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    final RecommendedProductsModel product =
                        rm.recommendedProductList[index];
                    return Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.getRecommendedFoodDetailPage(index),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.width20 * 6,
                              height: Dimensions.height20 * 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.height20),
                                    bottomLeft:
                                        Radius.circular(Dimensions.height20)),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      Utils.buildImagePath(product.img!)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  height: Dimensions.height20 * 5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.height20),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      top: Dimensions.height10,
                                      right: Dimensions.height10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(text: product.name!),
                                        SmallText(
                                            text:
                                                "With chinese Characteristics"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconText(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: AppColor.iconColor1,
                                            ),
                                            IconText(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: AppColor.mainColor,
                                            ),
                                            IconText(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: AppColor.iconColor2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, Products product) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index - 1) * (1 + _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // final int id = product.id!;
              Get.toNamed(Routes.getPopularFoodDetailPage(index));
            },
            child: Container(
              height: Dimensions.pageViewContainerHeight,
              margin: EdgeInsets.only(
                  left: Dimensions.width5, right: Dimensions.width5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height30),
                color: index.isEven ? Colors.amber : Colors.blueGrey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(Utils.buildImagePath(product.img!)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width15, right: Dimensions.width15),
                  child: InfoCard(text: product.name!)),
            ),
          ),
        ],
      ),
    );
  }
}
