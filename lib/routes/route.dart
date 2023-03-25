import 'package:get/get.dart';
import 'package:get_x/pages/cart/cart_page.dart';
import 'package:get_x/pages/food/popular_food_detail.dart';
import 'package:get_x/pages/food/recomended_food_detail.dart';
import 'package:get_x/pages/home/home_page.dart';
import 'package:get_x/pages/splash/splash_screen.dart';

class Routes {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cart = '/cart';
  static const String splash = '/splash';

  static String getPopularFoodDetailPage(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFoodDetailPage(int pageId, String? page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getInitial() => initial;
  static String getSplash() => splash;

  static String getCartPage() => cart;

  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => const HomePage(),
    ),
    GetPage(
      name: "/popular-food",
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/recommended-food",
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/cart",
      page: () {
        return const CartPage();
      },
    ),
    GetPage(
      name: "/splash",
      page: () {
        return const SplashScreen();
      },
    )
  ];
}
