import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({
    required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async{
    print('666666666666666666666666666666666666');
    Response response = await popularProductRepo.getPopularProductList();
    print("BBBBBBBBBBBBBB BBBBBBBBB        "+response.body.toString());
    if(response.statusCode == 200){
      print('55555555555');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      update();
    }else{
      print('777777777777777');
    }
  }
}