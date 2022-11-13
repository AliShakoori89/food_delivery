import 'package:food_delivery/data/api/api_cleint.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.userInfoURI);
  }
}