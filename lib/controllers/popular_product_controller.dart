import 'package:get/get.dart';
import 'package:get_x/controllers/cart_controller.dart';
import 'package:get_x/services/data/repository/popular_product_repo.dart';

import '../models/popular_product_model.dart';

class PopularProductController extends GetxController implements GetxService {
  final PopularProductRepo popularProductRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late CartController _cart;

  int _inCartItems = 0;
  int _quantity = 0;

  int get quantity => _quantity;
  int get inCartItems => _inCartItems + _quantity;

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
      if ((_inCartItems + _quantity) == 0) {
        Get.snackbar(
          "Item count",
          "item can't be negative",
        );
        return;
      }
      _quantity = _quantity - 1;
    }
    update();
  }

  void initProduct(CartController cart, Products product) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    // get from storage _inCartItems = _inCartItems from storage
    exist = cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(Products product) {
    _cart.addItemToCart(_quantity, product, inCartItems);
    _quantity = 0; // reset the quantity after adding
    _inCartItems = _cart.getQuantity(product);
    update();
  }

  int get totalItems => _cart.totalCartQuantity;
}
