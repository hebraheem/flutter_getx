import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/cart_model.dart';
import '../../../utils/app_constant.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void cartInStorage(List<CartM> cartList) {
    cart = [];
    /**
     * convert cart to string list because shared preferences
     * only allows string values
     */
    for (var element in cartList) {
      cart.add(jsonEncode(element));
    }

    sharedPreferences.setStringList(AppConstants.CART_KEY, cart);
    getCartList();
  }

  List<CartM> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_KEY)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_KEY)!;
    }

    List<CartM> cartList = [];
    for (var element in carts) {
      cartList.add(CartM.fromJson(jsonDecode(element)));
    }

    return cartList;
  }
}
