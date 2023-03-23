import 'package:get/get.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
import 'package:get_x/services/data/repository/popular_product_repo.dart';

import 'data/api/api_client.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com/api/v1/"));

// repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
