import 'package:food_delivery/data/api/api_cleint.dart';
import 'package:food_delivery/utils/api_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{

  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductUri);
  }

}