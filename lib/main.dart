import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
// import 'package:get_x/pages/food/popular_food_detail.dart';
import 'package:get_x/pages/food/recomended_food_detail.dart';
import 'package:get_x/services/dependencies.dart' as dep;
// import 'package:get_x/pages/home/main_food_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get X',
      theme: ThemeData(),
      home: const RecommendedFoodDetail(),
    );
  }
}
