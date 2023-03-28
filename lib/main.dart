// library import
import 'package:flutter/material.dart';
import 'package:get_x/controllers/popular_product_controller.dart';
import 'package:get_x/controllers/recommended_product_controller.dart';
import 'package:get_x/routes/route.dart';
import 'package:get_x/services/dependencies.dart' as dep;

//widget import
import 'package:get/get.dart';

import 'controllers/cart_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    cartController.getCartData();
    return GetBuilder<RecommendedProductController>(builder: (_) {
      return GetBuilder<PopularProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Get X',
          theme: ThemeData(),
          initialRoute: Routes.getSplash(),
          getPages: Routes.routes,
          // home: const SplashScreen(),
        );
      });
    });
  }
}
