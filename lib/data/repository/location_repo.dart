import 'package:food_delivery/data/api/api_cleint.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocationRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAddressFromGeocode(LatLng latLng) async{
    return await apiClient.getData('${AppConstants.geocodeURI}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }

  String getUserAddress(){
    return sharedPreferences.getString(AppConstants.userAddress) ?? "";
  }

  Future<Response> addAddress(AddressModel addressModel) async{
    return await apiClient.postData(AppConstants.addUserAddress, addressModel.toJson());
  }
}