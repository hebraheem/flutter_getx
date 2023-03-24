import 'package:get/get.dart';
import 'package:get_x/models/popular_product_model.dart';

import '../models/cart_model.dart';
import '../services/data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int, CartM> _items = {};
  Map<int, CartM> get cartItems => _items;

  void addItemToCart(int quantity, Products product, int? inCartItems) {
    if (quantity == 0 && inCartItems! > 0) {
      Get.snackbar(
        "Adding to cart",
        "Item already added to cart",
      );
      return;
    }
    if (quantity == 0) {
      Get.snackbar(
        "Adding to cart error",
        "You must have at least one product to add to cart",
      );
      return;
    }

    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        return CartM(
          id: value.id,
          quantity: value.quantity! + quantity,
          price: value.price,
          name: value.name,
          img: value.img,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
      _items.putIfAbsent(product.id!, () {
        return CartM(
          id: product.id,
          quantity: quantity,
          price: product.price,
          name: product.name,
          img: product.img,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    }
  }

  bool existInCart(Products product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(Products product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalCartQuantity {
    int totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}
