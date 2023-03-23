import 'package:get/get.dart';
import 'package:get_x/services/data/repository/popular_product_repo.dart';

import '../models/popular_product_model.dart';

class PopularProductController extends GetxController implements GetxService {
  final PopularProductRepo popularProductRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

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
}
