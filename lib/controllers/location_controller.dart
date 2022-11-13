import 'dart:convert';

import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService{
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placeMark = Placemark();
  Placemark _pickPlaceMark = Placemark();
  Placemark get placeMark => _placeMark;
  Placemark get pickPlaceMark => _pickPlaceMark;
  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList;
  final List<String> _addressTypeList=['home', 'office', 'others'];
  List<String> get addressTypeList => _addressTypeList;
  int _addressTypeIndex=0;
  int get addressTypeIndex => _addressTypeIndex;

  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  bool _changeAddress = true;

  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;

  void setMapController(GoogleMapController mapController){
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if(_updateAddressData){
      _loading = true;
      update();
      try{
        if(fromAddress){
          _position = Position(
              longitude: position.target.latitude,
              latitude: position.target.longitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }else{
          _pickPosition = Position(
              longitude: position.target.latitude,
              latitude: position.target.longitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }
        if(_changeAddress) {
          String _address = await getAddressFromGeocode(
            LatLng(
              position.target.latitude,
              position.target.longitude
            )
          );
          fromAddress ? _placeMark = Placemark(name: _address) :
              _pickPlaceMark = Placemark(name: _address);
        }
      }catch(e){
        print(e);
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String _address = "Unknown Location Found";
    Response response = await locationRepo.getAddressFromGeocode(latLng);
    if(response.body['status']=='OK'){
      _address = response.body['result'][0]['formatted_address'].toString();
    }else{
      print('Error getting the google api');
    }
    return _address;
  }

  late Map<String, dynamic> _getAddress;
  Map get getAddress=> _getAddress;

  AddressModel getUserAddress(){
    late AddressModel _addressModel;
    _getAddress = jsonDecode(locationRepo.getUserAddress());
    try{
      _addressModel = AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    }catch(e){
      print(e);
    }
    return _addressModel;
  }

  void setAddressTypeIndex(int index){
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress(AddressModel addressModel) async{
    _loading = true;
    update();
    Response response = await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;
    if(response.statusCode == 200){
      String message = response.body("message");
      responseModel = ResponseModel(true, message);
    }else{
      print("couldn't save the address");
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}