import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList){
    cart = [];

    cartList.forEach((element)=> cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.cartList, cart);
  }

  List<CartModel> getCartList(){
    List<String> carts=[];

    if(sharedPreferences.containsKey(AppConstants.cartList)){
      carts = sharedPreferences.getStringList(AppConstants.cartList)!;
    }
    List<CartModel> cartList=[];

    carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

   void addToCartHistoryList(){
    for(int i=0; i< cart.length; i++){
      cartHistory.add(cart[i]);
    }
    sharedPreferences.setStringList(AppConstants.cartHistoryList, cartHistory);
   }
}