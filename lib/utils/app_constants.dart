class AppConstants{
  static const String appName = 'DBFood';
  static const int appVersion = 1;
  static const String baseUrl = 'http://mvs.bslmeiyu.com';
  static const String popularProductURI = '/api/v1/products/popular';
  static const String recommendedProductURI = '/api/v1/products/recommended';
  static const String uploadURL = "/uploads/";

  //user and auth end point
  static const String registrationURI = '/api/v1/auth/register';
  static const String loginURI = '/api/v1/auth/login';
  static const String userInfoURI = '/api/v1/customer/info';

  static const String userAddress = 'user_address';
  static const String addUserAddress = '/api/v1/cusotmer/address/add';
  static const String geocodeURI = '/api/v1/config/geocode-api';

  static const String token = '';
  static const String phone = '';
  static const String password = '';
  static const String cartList = "cart-List";
  static const String cartHistoryList = "cart-history-list";
}