import 'package:get/get.dart';
import 'package:get_x/models/recommended_product_model.dart';
import 'package:get_x/services/data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RecommendedProductController({required this.recommendedRepo});

  List<dynamic> _recommendedProduct = [];
  List<dynamic> get recommendedProductList => _recommendedProduct;

  Future<void> getRecommendedList() async {
    Response response = await recommendedRepo.getRecommendedProductList();
    if (response.statusCode == 200 || response.statusCode == 201) {
      _isLoading = true;
      _recommendedProduct = [];
      _recommendedProduct
          .addAll(RecommendedProductModel.fromJson(response.body).products!);
      update();
    } else {
      _isLoading = true;
    }
  }
}
