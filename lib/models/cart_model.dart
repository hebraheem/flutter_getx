import 'package:get_x/models/popular_product_model.dart';

class CartModel {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<CartM>? _products;
  List<CartM>? get products => _products;

  CartModel(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  CartModel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <CartM>[];
      json['products'].forEach((v) {
        _products!.add(CartM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = _totalSize;
    data['type_id'] = _typeId;
    data['offset'] = _offset;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartM {
  int? id;
  String? name;
  int? quantity;
  int? price;
  bool? isExist;
  String? img;
  String? time;
  Products? product;

  CartM(
      {this.id,
      this.name,
      this.quantity,
      this.price,
      this.img,
      this.isExist,
      this.time,
      this.product});

  CartM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    isExist = json['isExist'];
    img = json['img'];
    time = json['time'];
    product = Products.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    data['quantity'] = quantity;
    data['isExist'] = isExist;
    data['time'] = time;
    data["product"] = product!.toJson();

    return data;
  }
}
