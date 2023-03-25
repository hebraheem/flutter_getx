import 'package:get/get.dart';
import 'package:get_x/controllers/cart_controller.dart';

// service import
import 'package:get_x/controllers/popular_product_controller.dart';
import 'package:get_x/controllers/recommended_product_controller.dart';
import 'package:get_x/services/data/repository/cart_repo.dart';
import 'package:get_x/services/data/repository/popular_product_repo.dart';
import 'package:get_x/services/data/repository/recommended_product_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_constant.dart';
import 'data/api/api_client.dart';

Future<void> init() async {
  // local storage
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

// repositories
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => RecommendedProductController(recommendedRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
}
