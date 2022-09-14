import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItems => _inCartItem+_quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }

  int checkQuantity(int quantity){
    if(quantity < 0 ){
      Get.snackbar("Item count", "you can't reduce more!",
      backgroundColor: AppColors.mainColor,
      colorText:  Colors.white);
      return 0;
    }else if(quantity > 20){
      Get.snackbar("Item count", "you can't add more!",
          backgroundColor: AppColors.mainColor,
          colorText:  Colors.white);
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(){
    _quantity = 0;
    _inCartItem = 0;
  }
}