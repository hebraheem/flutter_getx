import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/pages/cart/cart_page.dart';
import 'package:get_x/pages/food/popular_food_detail.dart';
import 'package:get_x/pages/food/recomended_food_detail.dart';
import 'package:get_x/pages/home/main_food_page.dart';

class Routes {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cart = '/cart';

  static String getPopularFoodDetailPage(int pageId) =>
      '$popularFood?pageId=$pageId';
  static String getRecommendedFoodDetailPage(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static String getInitial() => initial;

  static String getCartPage() => cart;

  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: "/popular-food",
      page: () {
        var pageId = Get.parameters["pageId"];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/recommended-food",
      page: () {
        var page = Get.parameters["pageId"];
        return RecommendedFoodDetail(
          pageId: int.parse(page!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/cart",
      page: () {
        return const CartPage();
      },
    )
  ];
}
