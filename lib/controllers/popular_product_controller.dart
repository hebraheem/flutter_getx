import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/services/data/repository/popular_product_repo.dart';
import 'package:get_x/utils/colors.dart';

import '../models/popular_product_model.dart';

class PopularProductController extends GetxController implements GetxService {
  final PopularProductRepo popularProductRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int get quantity => _quantity;

  int _quantity = 0;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProduct = [];
  List<dynamic> get popularProductList => _popularProduct;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200 || response.statusCode == 201) {
      _isLoading = true;
      _popularProduct = [];
      _popularProduct
          .addAll(PopularProductModel.fromJson(response.body).products!);
      update();
    } else {
      _isLoading = true;
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = _quantity + 1;
    } else {
      if (_quantity == 0) {
        Get.snackbar(
          "Item count",
          "item can't be negative",
          backgroundColor: AppColor.mainColor,
          colorText: Colors.white,
        );
        return;
      }
      _quantity = _quantity - 1;
    }
    update();
  }
}
